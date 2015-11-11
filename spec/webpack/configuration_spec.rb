require 'spec_helper'

RSpec.describe Webpack::Configuration do
  subject(:config) { described_class.new }

  before do
    config.port = 4242
    config.public_path = '/foobar'
    config.use_server = true
    config.extract_css = false
  end

  it 'has port option' do
    expect(config.port).to eq(4242)
  end

  it 'has public_path option' do
    expect(config.public_path).to eq('/foobar')
  end

  it 'has use_server option' do
    expect(config.use_server).to eq(true)
  end

  it 'has extract_css option' do
    expect(config.extract_css).to eq(false)
  end

  describe '#validate!' do
    it 'fails when port is nil' do
      config.port = nil
      expect { config.validate! }
        .to raise_error(RuntimeError, 'Webpack port is not configured')
    end

    it 'fails when public_path is nil' do
      config.public_path = nil
      expect { config.validate! }
        .to raise_error(RuntimeError, 'Webpack public_path is not configured')
    end
  end
end
