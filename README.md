# SassC for Middleman 3

This gem lets you use SassC with Middleman 3 by monkey patching relevant sass tilt templates.
(Middleman 4 supports SassC out of box.)

## Installation

In `Gemfile`:
```ruby
gem 'middleman3-sassc', '~> 0.0.1'
```

In `config.rb`:

```ruby
activate :sassc
```

## How do I know if it’s SassC compiling my sass files?

There are a few ways to tell:

* Sass compilation will be noticeably faster, especially for large projects.
* SassC does not support Compass, so `@import "compass"` will fail.
* SassC currently only supports Sass syntax up to 3.2. Using new features will fail.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
