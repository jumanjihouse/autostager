# encoding: utf-8
require 'syslog'

module Autostager
  # Interface to Posix syslog.
  module Logger
    module_function

    # Log a message to syslog at a specified priority level
    #
    # priority level must be one of:
    #
    # * :crit
    # * :emerg emergency
    # * :alert
    # * :err
    # * :warning
    # * :notice
    # * :info (default if level is not specified)
    # * :debug
    #
    # @param msg [String] the message you want to send to syslog
    # @param level [Symbol] the priority of the message
    def log(msg, level = :info)
      msg = safe(msg)
      $stderr.puts "#{DateTime.now} #{msg}" if ENV.key?('debug')
      Syslog.open($PROGRAM_NAME, Syslog::LOG_PID | Syslog::LOG_CONS) do |s|
        s.send(level, '%s', msg)
      end
    end

    # Make a string safe for syslog.
    # @see http://goo.gl/hcDiqu
    #
    # @param [String] A string that could be unsafe.
    #
    # @return [String] A safe copy of the original string.
    def safe(str)
      URI.unescape(str)
    end
  end
end
