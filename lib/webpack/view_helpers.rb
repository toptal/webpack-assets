module Webpack
  module ViewHelpers
    def webpack_context
      Context.new(self)
    end

    # @param name [String]
    def webpack_js_tag(name)
      javascript_include_tag(webpack_entry_url(name, :js))
    end

    # @param name [String]
    def webpack_css_tag(name)
      stylesheet_link_tag(webpack_entry_url(name, :css)) if Webpack.config.extract_css
    end

    # @param name [String]
    # @param ext [String]
    # @return [String]
    def webpack_entry_url(name, ext)
      webpack_context.entry_url(name, ext)
    end

    # @param path [String]
    # @return [String]
    def webpack_static_file_url(path)
      webpack_context.static_file_url(path)
    end

    class Context
      attr_reader :view_context

      def initialize(view_context)
        @view_context = view_context
      end

      def entry_url(name, ext)
        if Webpack.config.use_server
          server_url("#{name}.#{ext}")
        else
          Webpack.fetch_entry(name.to_s, ext.to_s)
        end
      end

      def static_file_url(path)
        if Webpack.config.use_server
          server_url(path)
        else
          Webpack.fetch_static_file("#{Webpack.config.static_path}/#{path}")
        end
      end

      private

      def server_url(path)
        "//#{view_context.request.host}:#{Webpack.config.port}#{Webpack.config.public_path}/#{path}"
      end
    end
  end
end
