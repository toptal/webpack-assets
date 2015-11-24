# Webpack Assets

Webpack-Rails integration.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'webpack-assets'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install webpack-assets

## Usage

Minimal configuration (`config/initializers/webpack.rb`):

```ruby
Webpack.configure do |config|
  config.port = 4000
  config.public_path = '/assets'
  config.static_path = 'front/static'
end
```

Required settings:

- `port` - the port webpack dev server is running on.
- `public_path` - the base path for assets.
- `static_path` - the root path for static files.

Optional settings:

- `use_server` - whether webpack dev server is being used (`Rails.env.development?` by default).
- `extract_css` - whether css is extracted to a separate file (`!Rails.env.development?` by default).

View helpers:

- `webpack_js_tag` is a replacement for `javascript_include_tag`.

- `webpack_css_tag` is a replacement for `stylesheet_link_tag`.

- `webpack_static_file_url` resolves paths to static files (assets used directly from HTML), e.g.:

  ```erb
  <%= image_tag webpack_static_file_url('img/logo.png') %>
  ```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toptal/webpack-assets. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
