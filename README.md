# Improve Typography

[![Build Status](https://travis-ci.org/tomasc/improve_typography.svg)](https://travis-ci.org/tomasc/improve_typography) [![Gem Version](https://badge.fury.io/rb/improve_typography.svg)](http://badge.fury.io/rb/improve_typography) [![Coverage Status](https://img.shields.io/coveralls/tomasc/improve_typography.svg)](https://coveralls.io/r/tomasc/improve_typography)

Improves typography (quotes, hyphens, etc.) of a given string. Works well with I18n.

Easy to extend by the way of locale files and processors. **Pull requests are welcome!**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'improve_typography'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install improve_typography

## Usage

```ruby
ImproveTypography::Base.call("'so it isn't authorless'") # => "‘so it isn’t authorless’"
```

Only text inside XHTML tags is corrected (quotes around attributes etc. are preserved).

### Locale

The replacements are locale-specific (corresponding to `I18n.locale`), with a fallback to default `:en`.

Locale can be also provided locally as:

```ruby
ImproveTypography::Base.call("'so it isn't authorless'", locale: :cs)
```

### Extending locales

There are two options how to provide locale-specific replacements:

#### Via locale files (preferred)

Create or override locale files in your application. See the locale files in the `locales` folder.

#### Via custom class

For more complex replacements, where the above method is not sufficient, it is possible to create locale-specific classes and override default behavior. For example:

```ruby
module ImproveTypography
  module Processors
    module CS # locale name in upcase
      class SingleQuotes < Processor
        def call
          # custom behavior
        end
      end
    end
  end
end
```

### Configuration

You can configure applied processors (and their order).

#### Globally

```ruby
ImproveTypography.configure do |config|
  config.processors = [ImproveTypography::Processors::Ellipsis]
end
```

#### Locally

```ruby
ImproveTypography::Base.call("'so it isn't authorless'", processors: [ImproveTypography::Processors::Ellipsis])
```

## Available processors

* `Apostrophe`
* `DoubleQuotes`
* `Ellipsis`
* `EmDash`
* `EnDash`
* `MultiplySign`
* `Nbsp`
* `Numbers`
* `SingleQuotes`
* `Units`
* `WordLineSeparator`

## Supported locales

* `:en` (Int. English)
* `:cs` (Czech)

## Resources and inspiration

* [SmartyPants](https://michelf.ca/projects/php-smartypants)
* [Truty](https://github.com/mkj-is/Truty)
* [Typogruby](https://avdgaag.github.io/typogruby)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomasc/improve_typography.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
