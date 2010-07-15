require 'resque'
# Causes problems when included with Sinatra?? when loading workers rake task
# require 'resque_scheduler'

require "resque/plugins/empty_queue_job"
