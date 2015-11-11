require 'rails_helper'

RSpec.describe Webpack::ViewHelpers, type: :helper do
  before do
    Webpack.configure do |config|
      config.port = 4242
      config.public_path = '/foobar'
      config.extract_css = true
    end

    Webpack.load_entries(
      'app' => {
        'js'  => '/foobar/baz.42.js',
        'css' => '/foobar/baz.12.css'
      }
    )
  end

  describe '#webpack_js_tag' do
    subject { helper.webpack_js_tag(:app) }

    it 'uses assets server url in development' do
      Webpack.config.use_server = true
      is_expected.to include('"//test.host:4242/foobar/app.js"')
    end

    it 'uses precompiled path' do
      Webpack.config.use_server = false
      is_expected.to include('"/foobar/baz.42.js"')
    end
  end

  describe '#webpack_css_tag' do
    subject { helper.webpack_css_tag(:app) }

    it 'uses assets server url in development' do
      Webpack.config.use_server = true
      is_expected.to include('//test.host:4242/foobar/app.css')
    end

    it 'uses precompiled path' do
      Webpack.config.use_server = false
      is_expected.to include('"/foobar/baz.12.css"')
    end

    it 'does not render css tag when extract_css is false' do
      Webpack.config.extract_css = false
      is_expected.to be_nil
    end
  end
end
