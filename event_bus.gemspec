# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "event_bus/version"

Gem::Specification.new do |spec|
  spec.name          = "event_bus"
  spec.version       = EventBus::VERSION
  spec.authors       = ["Romain Champourlier"]
  spec.email         = ["public@rchampourlier.com"]

  spec.summary       = "A really simple implementation of an Event Bus in Ruby, mostly for my own projects."
  spec.description   = "This provides a simple implementation of an Event Bus. It makes easy to use the abstraction" \
                       "without needing dedicated components, like RabbitMQ. Using this will however make it easy" \
                       "to rewrite your code to use more solid foundations for the future."
  spec.homepage      = "https://github.com/rchampourlier/event_bus"

  # Prevent pushing this gem to RubyGems.org by setting "allowed_push_host", or
  # delete this section to allow pushing this gem to any host.
  unless spec.respond_to?(:metadata)
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end
  spec.metadata["allowed_push_host"] = 'TODO: Set to "http://mygemserver.com"'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
