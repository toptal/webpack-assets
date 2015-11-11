require 'rails/railtie'

module Webpack
  module Assets
    class Railtie < Rails::Railtie
      config.after_initialize do
        Webpack.config.use_server  =  Rails.env.development?
        Webpack.config.extract_css = !Rails.env.development?
      end

      config.to_prepare do
        path = Rails.root.join('webpack-assets.json')
        if File.exist?(path)
          entries = JSON.parse(File.read(path))
        else
          entries = {}
        end

        Webpack.load_entries(entries)
      end
    end
  end
end
