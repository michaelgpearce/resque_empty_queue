require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'resque/resque'
require 'resque/empty_queue'
require 'resque/empty_queue_job'

class Test::Unit::TestCase
end

#fixture classes
class DefaultEmptyQueueJob < Resque::EmptyQueueJob
  wait_for_empty_queue :some_queue
  @queue = :empty_queue

  def self.perform(some_id, some_other_thing)
    puts "default empty queue perform"
  end
end

class QueuedJob
  @queue = :some_queue

  def self.perform(some_id, some_other_thing)
    sleep(2)
    puts "queued job perform"
  end
end

