# frozen_string_literal: true
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

# Simplecov setup
require "simplecov"
SimpleCov.start do
  add_filter do |src|
    src.filename =~ %r{/spec/}
  end
end

require "event_train"
RSpec.configure do |config|
  config.order = :random
  config.after(:each) { EventTrain.reset_all_channels }
end
