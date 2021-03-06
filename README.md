# EventTrain

[![Build Status](https://travis-ci.org/rchampourlier/event_train.svg?branch=master)](https://travis-ci.org/rchampourlier/event_train)
[![Code Climate](https://codeclimate.com/github/rchampourlier/event_train/badges/gpa.svg)](https://codeclimate.com/github/rchampourlier/event_train)
[![Test Coverage](https://codeclimate.com/github/rchampourlier/event_train/badges/coverage.svg)](https://codeclimate.com/github/rchampourlier/event_train/coverage)
[![Issue Count](https://codeclimate.com/github/rchampourlier/event_train/badges/issue_count.svg)](https://codeclimate.com/github/rchampourlier/event_train)

EventTrain is a really simple implementation of an EventTrain in Ruby. It enables you to start implementing your application using an event bus pattern without relying on some specific pub/sub service or component (like Redis, RabbitMQ). This will enable to move to such future-proof implementation just by using the same interface, thus reducing the need for refactoring or rewrites!

## Installation

Add this line to your application's Gemfile:

```ruby
gem "event_train"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install event_train

## Usage

```ruby
# Subscribe and publish to the :global channel
EventTrain.subscribe do |event_name:, event_data:|
  puts "Received event named #{event_name} with data #{event_data}"
end
EventTrain.publish(event_name: :my_first_event, event_data: true)
# => "Received event named my_first_event with data true"

# To subscribe / publish to a specific channel, just add the :channel_name parameter:
EventTrain.publish(channel_name: :my_first_channel, ...)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rchampourlier/event_train. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
