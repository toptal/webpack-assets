require 'webpack/assets/version'
require 'webpack/configuration'

module Webpack
  class << self
    # @return [Webpack::Configuration]
    def config
      @config ||= Configuration.new
    end

    # @yield config
    # @yieldparam [Webpack::Configuration]
    # @example
    #   Webpack.configure do |config|
    #     config.port = 4000
    #     config.path = '/assets'
    #   end
    def configure
      yield config
      config.validate!
    end

    def reset
      @config = nil
    end

    # @param entries [Hash]
    def load_entries(entries)
      @entries = entries
    end

    # @param name [String]
    # @param ext [String]
    # @return [String]
    def fetch_entry(name, ext)
      entries = @entries[name]
      entry = entries[ext] if entries
      fail "#{name}.#{ext} does not exist" unless entry
      entry
    end

    # @param static_files [Hash]
    def load_static_files(static_files)
      @static_files = static_files
    end

    # @param path [String]
    # @return [String]
    def fetch_static_file(path)
      static_file = @static_files[path]
      fail "#{path} does not exist" unless static_file
      static_file
    end
  end
end
