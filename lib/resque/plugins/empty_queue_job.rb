module Resque
  module Plugins
    class EmptyQueueFailureDetectedError < RuntimeError;
    end

    module EmptyQueueJob
      def queue
        :empty_queue
      end

      def wait_for_empty_queue(queue_name)
        @queue_name = queue_name
      end

      def queue_name
        return @queue_name
      end

      def before_perform_empty_queue_job(*args)
        if !failure_queue_empty?
          # should this re-enqueue itself or simply continue to retry
          raise EmptyQueueFailureDetectedError.new("Failure detected in queue: #{queue_name}. Retry after jobs placed in queue.")
        end

        if !job_queue_empty? || !working_queue_empty?
          # try again later
          Resque.enqueue_in(5, self, *args)
          raise Resque::Job::DontPerform
        end
      end

      private

      def job_queue_empty?
        return Resque.size(queue_name) == 0
      end

      def working_queue_empty?
        return Resque::Worker.all.all? { |worker| worker.job['queue'] != queue_name.to_s }
      end

      def failure_queue_empty?
        i = 0
        page_size = 100
        while !(failures = Resque::Failure.all(i, i + page_size)).empty?
          return false unless failures.all? { |failure| failure.nil? || failure['retried_at'] || failure['queue'] != queue_name.to_s }
          i = i + page_size
        end

        return true
      end
    end
  end
end
