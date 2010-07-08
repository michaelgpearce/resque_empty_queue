require File.dirname(__FILE__) + '/../test_helper'

class ResqueTest < Test::Unit::TestCase

  context "Resque" do
    setup do
      Resque.redis.flushall
      @bogus_args = "bogus_arg"
    end

    context "#enqueue" do

      context "the queue is not empty" do
        setup do
          Resque.enqueue(QueuedJob, @bogus_args)
        end

        should "not add another job to the queue and raise an exception" do
          assert_raises(Resque::EmptyQueueError) { Resque.enqueue(DefaultEmptyQueueJob, @bogus_args) }
        end
      end

      context "the queue is empty" do
        should "raise an exception on a duplicate indentifier" do
          Resque.expects(:enqueue_without_empty_queue).once
          Resque.enqueue(DefaultEmptyQueueJob, @bogus_args)
        end
      end

    end
  end
end
