require 'spec_helper'

RSpec.describe Webpack do
  extend Forwardable
  def_delegators :described_class, :configure, :config, :load_entries, :fetch_entry

  before do
    allow_any_instance_of(Webpack::Configuration)
      .to receive(:validate!)
  end

  describe '.configure' do
    it 'yields config' do
      configure do |config|
        expect(config).to be_an_instance_of(Webpack::Configuration)
      end
    end

    it 'validates config' do
      expect_any_instance_of(Webpack::Configuration)
        .to receive(:validate!)
      configure {}
    end
  end

  describe '.config' do
    subject { config }

    it 'returns config' do
      is_expected.to be_an_instance_of(Webpack::Configuration)
    end
  end

  describe '.fetch_entry' do
    before { load_entries('foo' => {'js' => '/bar'}) }

    it 'returns entry' do
      expect(fetch_entry('foo', 'js')).to eq('/bar')
    end

    it 'fails when entry does not exist' do
      expect { fetch_entry('bar', 'js') }
        .to raise_error('bar.js does not exist')
    end

    it 'fails when entry does not include ext' do
      load_entries('foo' => {'js' => '/baz'})
      expect { fetch_entry('foo', 'css') }
        .to raise_error('foo.css does not exist')
    end
  end
end
