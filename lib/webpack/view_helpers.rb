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
          static_file = Webpack.fetch_static_file("#{Webpack.config.static_path}/#{path}")
          if Webpack.config.cdn_host.present?
            "#{protocol}#{Webpack.config.cdn_host}#{static_file}"
          else
            static_file
          end
        end
      end

      private

      def protocol
        @view_context.request.protocol.presence || '//'
      end

      def server_url(path)
        "#{protocol}#{server_host}#{Webpack.config.public_path}/#{path}"
      end

      def server_host
        Webpack.config.host || "#{view_context.request.host}:#{Webpack.config.port}"
      end
    end
  end
end
