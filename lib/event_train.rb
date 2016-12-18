# frozen_string_literal: true
require "event_train/version"
require "event_train/channel"

# A basic pub/sub event bus.
#
# How to use
# ==========
#
# EventTrain.subscribe { |event_name:, event_data:| puts "received #{event_name}"}
# EventTrain.publish(event_name: :some_event, event_data: true)
module EventTrain
  @channels = {}

  # Publishes a new event on the specified channel.
  def publish(event_name:, event_data:, channel_name: :global)
    channel = get_channel(name: channel_name)
    channel.publish(event_name: event_name, event_data: event_data)
  end
  module_function :publish

  def subscribe(channel_name: :global, &block)
    channel = get_channel(name: channel_name)
    channel.subscribe(&block)
  end
  module_function :subscribe

  def get_channel(name:)
    @channels[name] ||= build_channel(name: name)
  end
  module_function :get_channel

  def build_channel(name:)
    Channel.new(name: name)
  end
  module_function :build_channel

  # Reset all channels, removing all subscribed blocks.
  def reset_all_channels
    @channels = {}
  end
  module_function :reset_all_channels
end
