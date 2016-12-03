# frozen_string_literal: true
require "logger"

module EventBus

  # A channel where events may be published and to which consumers
  # may subscribe.
  #
  # Interacting with a channel directly is not mandatory, you may
  # use the global EventBus module to access it without the channel
  # instance. The top-level module acts as a singleton.
  class Channel
    attr_reader :name, :logger

    def initialize(name:, logger: default_logger)
      @name = name
      @logger = logger
      @subscribed_blocks = []
    end

    def publish(event_name:, event_data:)
      raise ArgumentError, "event_name must be a Symbol" unless event_name.is_a?(Symbol)
      subscribed_blocks.map do |block|
        block.call(event_name: event_name, event_data: event_data)
      end
    end

    def subscribe(&block)
      unless block_given?
        raise ArgumentError, "A block must be passed to subscribe"
      end
      add_subscribed_block(&block)
    end

    private

    attr_reader :subscribed_blocks

    def add_subscribed_block(&block)
      subscribed_blocks.push(block)
    end

    def default_logger
      logger = Logger.new(STDOUT)
      logger.level = Logger::DEBUG
      logger
    end
  end
end
