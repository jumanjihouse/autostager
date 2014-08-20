# encoding: utf-8
require 'autostager/logger'

module Autostager
  # Start and run the autostager in a loop.
  class CLI
    include Autostager::Logger

    # Entry point for the app.
    # Stage pull requests on a 30-second loop.
    def run
      trap_interrupt
      loop do
        Autostager.run
        log "Sleep for #{sleep_interval} seconds."
        sleep sleep_interval
      end
    rescue Interrupt
      log 'Exit on interrupt'
      exit!(0)
    end

    def sleep_interval
      ENV['sleep_interval'] || 30
    end

    def trap_interrupt
      Signal.trap('INT') do
        log 'Exit on interrupt'
        exit!(0)
      end
    end
  end
end
