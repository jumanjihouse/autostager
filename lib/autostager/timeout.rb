# encoding: utf-8

module Autostager
  # Meta-module to call the correct library method
  # for the version of Ruby on which the autostager runs.
  module Timeout
    module_function

    # The ruby timeout.rb library is unreliable on 1.8.7,
    # so we use a gem to provide timeouts if this script
    # is running on 1.8.7.
    # @see http://ph7spot.com/musings/system-timer
    #
    # @param seconds [Fixnum] Expiration time.
    # @param err [StandardErr] Raise err on expiration.
    # @param block [Block] Code that is subject to expiration.
    #
    # @return [nil]
    def timeout(seconds, err, &block)
      if RUBY_VERSION =~ /1.8/
        require 'system_timer'
        SystemTimer.timeout_after(seconds, err) { block.call }
      else
        require 'timeout'
        ::Timeout.timeout(seconds, err) { block.call }
      end
    end
  end
end
