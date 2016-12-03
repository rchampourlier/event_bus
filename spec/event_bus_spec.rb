# frozen_string_literal: true
require "spec_helper"

describe EventBus do
  let(:channel_name) { :test_channel }
  let(:event_name) { :event_name }
  let(:event_data) { { event_data: true } }
  let(:expecting_double) { double("Expecting double") }

  it "publishes and subscribes to the global channel" do
    expect(expecting_double).to receive(:execute).with(event_name, event_data)
    EventBus.subscribe do |event_name:, event_data:|
      expecting_double.execute(event_name, event_data)
    end
    EventBus.publish(event_name: event_name, event_data: event_data)
  end

  it "does not publish a specific channel's event to the global channel" do
    expect(expecting_double).not_to receive(:execute)
    EventBus.subscribe do |event_name:, event_data:|
      expecting_double.execute(event_name, event_data)
    end
    EventBus.publish(event_name: event_name, event_data: event_data, channel_name: channel_name)
  end

  it "publishes and subscribes to a specific channel" do
    expect(expecting_double).to receive(:execute).with(event_name, event_data)
    EventBus.subscribe(channel_name: channel_name) do |event_name:, event_data:|
      expecting_double.execute(event_name, event_data)
    end
    EventBus.publish(event_name: :wrong_event, event_data: event_data)
    EventBus.publish(event_name: event_name, event_data: event_data, channel_name: channel_name)
  end

  it "has a version number" do
    expect(EventBus::VERSION).not_to be nil
  end
end
