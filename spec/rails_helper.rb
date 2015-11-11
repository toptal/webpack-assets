require 'spec_helper'
require 'action_controller'
require 'action_view'
require 'rspec/rails'

module Rails
  def self.env
    ActiveSupport::StringInquirer.new('test')
  end
end

RSpec.configure do |config|
  config.include RSpec::Rails::HelperExampleGroup, type: :helper
end
