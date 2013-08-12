# Sinatra::Verbose

Sinatra verbose logging extension

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sinatra-verbose'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install sinatra-verbose
```

## Usage

### Classic Application

To enable the verbose logger in a classic application all you need to do is
require it:

```ruby
require 'sinatra'
require 'sinatra/verbose' if development?

# Your classic application code goes here...
```

### Modular Application

To enable the verbose logger in a modular application all you need to do is
require it, and then, register it:

```ruby
require 'sinatra/base'
require 'sinatra/verbose'

class MyApp < Sinatra::Base
  configure :development do
    register Sinatra::Verbose
  end

  # Your modular application code goes here...
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See the [LICENSE](https://github.com/patriciomacadden/sinatra-verbose/blob/master/LICENSE).
