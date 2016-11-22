# Improve Typography

[![Build Status](https://travis-ci.org/tomasc/improve_typography.svg)](https://travis-ci.org/tomasc/improve_typography) [![Gem Version](https://badge.fury.io/rb/improve_typography.svg)](http://badge.fury.io/rb/improve_typography) [![Coverage Status](https://img.shields.io/coveralls/tomasc/improve_typography.svg)](https://coveralls.io/r/tomasc/improve_typography)

Improves typography (quotes, hyphens, etc.) of a given string. Works well with I18n.

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

### Options

#### Locale

Pass in locale, either as a symbol or string (:en, :cs, …) for language specific corrections. **Pull requests for support for additional languages are welcome!**

```ruby
ImproveTypography::Base.call("'so it isn't authorless'", locale: I18n.locale)
```

### Configuation

```ruby
ImproveTypography.configure do |config|
  default_locale = :en
  multiply = ' × ' # or '×'
  em_dash = '—' # or ' – '
  only = %i(correct_ellipsis) # or except = %i(replace_en_dash)
end
```

## List of processors

* `replace_ellipsis`
* `replace_em_dash`
* `replace_en_dash`

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
