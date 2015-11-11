require 'webpack'
require 'webpack/view_helpers'
require 'webpack/rails' if defined?(Rails)
require 'active_support/lazy_load_hooks'

ActiveSupport.on_load(:action_view) do
  include Webpack::ViewHelpers
end
