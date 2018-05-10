require 'spec_helper'

describe Autostager do
  describe 'timeout_seconds' do
    it 'defaults to 120 seconds' do
      ENV['timeout'] = nil
      described_class.timeout_seconds.should eql(120)
    end

    it 'uses ENV["timeout"] if exists' do
      ENV['timeout'] = '1'
      described_class.timeout_seconds.should eql(1)
    end

    it 'fails if timeout is zero' do
      ENV['timeout'] = '0'
      expect { described_class.timeout_seconds }.to raise_error(RuntimeError)
    end

    it 'fails if timeout is negative' do
      ENV['timeout'] = '-5'
      expect { described_class.timeout_seconds }.to raise_error(RuntimeError)
    end

    it 'dynamically adjusts based on env var' do
      ENV['timeout'] = '1'
      described_class.timeout_seconds.should eql(1)

      ENV['timeout'] = '2'
      described_class.timeout_seconds.should eql(2)
    end
  end
end
