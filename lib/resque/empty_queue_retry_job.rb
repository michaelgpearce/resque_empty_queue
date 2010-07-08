module Resque
  class EmptyQueueRetryJob
    @queue = :resque_empty_queue

    def self.perform(empty_queue_job_class_name, *args)
      klass = eval(empty_queue_job_class_name)
      if queue_is_empty?(klass)
        Resque.enqueue(klass, *args)
      else
        # TODO: use resque-scheduler to enqueue in the future
        Resque.enqueue_in(5, self, klass.name, *args)
      end
    end

    def self.queue_is_empty?(klass)
      return Resque.size(klass.queue_name) == 0
    end
  end
end
