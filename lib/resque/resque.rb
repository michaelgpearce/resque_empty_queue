require "resque/empty_queue"

module Resque
  extend self

  # Raised when trying to create a job that does not yet have an empty associated job queue
  class EmptyQueueError < RuntimeError;
  end

  def enqueue_with_empty_queue(klass, *args)
    if !empty_queue_job?(klass) || should_execute_empty_queue_job?(klass, *args)
      enqueue_without_empty_queue(klass, *args)
    else
      # queue not empty
      enqueue_without_empty_queue(EmptyQueueRetryJob, klass.name, *args)
    end
  end

  alias_method :enqueue_without_empty_queue, :enqueue
  alias_method :enqueue, :enqueue_with_empty_queue

  private

  def should_execute_empty_queue_job?(klass, *args)
    return true if queue_is_empty?(klass)
    return false
  end

  def queue_is_empty?(klass)
    return Resque.size(klass.queue_name) == 0
  end

  def empty_queue_job?(klass)
    klass.ancestors.include?(Resque::EmptyQueueJob)
  end
end
