# Magvar

This is a port of the FlightGear magnetic variation model to Ruby. It provides a tiny wrapper around their magnetic variatio
estimator that can be used for creating sim flight planners, estimators and such.

Please be advised that since the FlightGear code is GPLv2 liensed, this gem has to have this license as well. This situation
might change in the future, but for now it is what it is. Using GPL-licensed libraries in commercial projects is a gray area,
if this is critical for you you might need to consider alternatives.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'magvar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install magvar

## Usage


```ruby
require 'magvar'
  # Location is any object that responds to `#lat` and `#lon`, and returns the
  # latitude and longitude in degrees as a Float. Positive latitudes are North,
  # positive longitudes are East.
  pt = Struct.new(:lat, :lon).new(68.781751845, 32.752029995)
  Magvar.variation_at(pt.lat, pt.lon, elev_km=0, Time.now) # ~ 16.15
```


## Development

After checking out the repo, run `bundle install` to install dependencies.
Then, run `rake` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/magvar.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

