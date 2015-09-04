# encoding: utf-8
require 'spec_helper'

describe Autostager do
  describe 'timeout_seconds' do
    it 'defaults to 120 seconds' do
      ENV['timeout'] = nil
      Autostager.timeout_seconds.should eql(120)
    end

    it 'should use ENV["timeout"] if exists' do
      ENV['timeout'] = '1'
      Autostager.timeout_seconds.should eql(1)
    end

    it 'fails if timeout is zero' do
      ENV['timeout'] = '0'
      expect { Autostager.timeout_seconds }.to raise_error(RuntimeError)
    end

    it 'fails if timeout is negative' do
      ENV['timeout'] = '-5'
      expect { Autostager.timeout_seconds }.to raise_error(RuntimeError)
    end

    it 'dynamically adjusts based on env var' do
      ENV['timeout'] = '1'
      Autostager.timeout_seconds.should eql(1)

      ENV['timeout'] = '2'
      Autostager.timeout_seconds.should eql(2)
    end
  end
end
