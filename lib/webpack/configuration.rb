module Webpack
  class Configuration
    # @attribute port [Integer]
    attr_accessor :port

    # @attribute public_path [String]
    attr_accessor :public_path

    # @attribute static_path [String]
    attr_accessor :static_path

    # @attribute use_server [Boolean]
    attr_accessor :use_server

    # @attribute extract_css [Boolean]
    attr_accessor :extract_css

    def validate!
      %w[port public_path].each do |attr|
        fail "Webpack #{attr} is not configured" unless public_send(attr)
      end
    end
  end
end
