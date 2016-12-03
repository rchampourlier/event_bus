require "spec_helper"
require "event_bus/channel"

describe EventBus::Channel do
  subject { described_class.new(name: :any) }

  describe "#publish" do
    it "raises an error if the event name is not a Symbol" do
      expect do
        subject.publish(event_name: "not a sympbl", event_data: nil)
      end.to raise_error(ArgumentError, "event_name must be a Symbol")
    end
  end

  describe "#subscribe" do
    it "raises an error if no block is passed" do
      expect do
        subject.subscribe
      end.to raise_error(ArgumentError, "A block must be passed to subscribe")
    end
  end
end
