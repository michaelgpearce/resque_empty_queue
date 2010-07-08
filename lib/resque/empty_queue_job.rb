module Resque
  class EmptyQueueJob
    def self.wait_for_empty_queue(queue_name)
      @queue_name = queue_name
    end

    def self.queue_name
      return @queue_name
    end
  end
end
