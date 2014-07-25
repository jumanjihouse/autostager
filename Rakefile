# encoding: utf-8
# vim: set ts=2 sw=2 ai et:

# Does the current user have root privileges?
#
# @return [Boolean] true if user can exercise root privileges;
#   false if user does not have privileges OR we're on a
#   non-posix platform
def got_root?
  # attempt to exercise privilege
  Process::Sys.setuid(0)
  true
rescue Errno::EPERM
  false
end

abort 'Must not run as root' if got_root?

require 'bundler/gem_tasks'
require 'bundler/setup'
require 'bundler/settings'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'fileutils'

task default: [:help]

desc 'Display the list of available rake tasks'
task :help do
  system('rake -T')
end

# Run unit tests before functional tests.
desc 'Run rspec tests'
task test: [
  :rubocop,
  :unit,
  :functional,
]

RSpec::Core::RakeTask.new(:unit) do |t|
  t.pattern = 'spec/unit/**/*_spec.rb'
end

RSpec::Core::RakeTask.new(:functional) do |t|
  t.pattern = 'spec/functional/**/*_spec.rb'
end

desc 'Run RuboCop'
RuboCop::RakeTask.new(:rubocop) do |t|
  t.options.unshift '--display-cop-names'
end
