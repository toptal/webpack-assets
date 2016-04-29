module Webpack
  class Configuration
    # @attribute port [Integer]
    attr_accessor :port

    # @attribute host [String]
    attr_accessor :host

    # @attribute public_path [String]
    attr_accessor :public_path

    # @attribute static_path [String]
    attr_accessor :static_path

    # @attribute cdn_host [String]
    attr_accessor :cdn_host

    # @attribute use_server [Boolean]
    attr_accessor :use_server

    # @attribute extract_css [Boolean]
    attr_accessor :extract_css

    def validate!
      fail 'Webpack public_path is not configured' unless public_path
      fail 'Webpack port is not configured' unless port || host
    end
  end
end
