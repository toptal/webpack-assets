require 'rails/railtie'

module Webpack
  module Assets
    class Railtie < Rails::Railtie
      config.after_initialize do
        Webpack.config.use_server  =  Rails.env.development?
        Webpack.config.extract_css = !Rails.env.development?
      end

      config.to_prepare do
        {load_entries: 'webpack-assets.json', load_static_files: 'static.json'}.each do |load_method, filename|
          path = Rails.root.join(filename)
          if File.exist?(path)
            data = JSON.parse(File.read(path))
          else
            data = {}
          end
          Webpack.public_send(load_method, data)
        end
      end
    end
  end
end
