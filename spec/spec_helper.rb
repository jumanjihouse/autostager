# encoding: utf-8
require 'minitest'
require 'mocha/setup'
require 'English'
require 'tempfile'
require 'pp'

RSpec.configure do |c|
  c.mock_with :mocha
  c.color = true
  c.formatter = 'doc'

  # Allow both "should" and "expect" syntax.
  # https://www.relishapp.com/rspec/rspec-expectations/docs/syntax-configuration
  c.expect_with :rspec do |e|
    e.syntax = [:should, :expect]
  end

  # Fail overall as soon as first test fails.
  # Fail fast to reduce duration of test runs.
  # IOW get out of the way so that the next pull request gets tested.
  c.fail_fast = true

  # Make it easy for spec tests to find fixtures.
  c.add_setting :fixture_path, default: nil
  c.fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))
end
