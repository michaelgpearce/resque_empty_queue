# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'resque_empty_queue'
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ['Michael G. Pearce', 'J. A. Wheeler']
  s.date = '2010-07-07'
  s.description = 'resque_empty_queue is an extension to the Resque queue system runs a job after a queue has been emptied.'
  s.email = %q{michael.pearce@bookrenter.com, andrew.wheeler@bookrenter.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/resque_empty_queue.rb",
     "lib/resque/plugins/empty_queue_job.rb",
     "resque_empty_queue.gemspec",
     "test/resque/resque_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = 'http://github.com/michaelgpearce/resque_empty_queue'
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = 'resque_empty_queue is an extension to the Resque queue system runs a job after a queue has been emptied.'
  s.test_files = [
    "test/resque/resque_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<resque>, [">= 1.6.0"])
      s.add_runtime_dependency(%q<resque-scheduler>, [">= 0"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.8"])
    else
      s.add_dependency(%q<resque>, [">= 1.6.0"])
      s.add_dependency(%q<resque-scheduler>, [">= 0"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0.9.8"])
    end
  else
    s.add_dependency(%q<resque>, [">= 1.6.0"])
    s.add_dependency(%q<resque-scheduler>, [">= 0"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0.9.8"])
  end
end

