# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webpack/assets/version'

Gem::Specification.new do |spec|
  spec.name          = 'webpack-assets'
  spec.version       = Webpack::Assets::VERSION
  spec.authors       = ['Sergey Nartimov']
  spec.email         = ['sergey.nartimov@toptal.com']

  spec.summary       = 'TODO: Write a short summary, because Rubygems requires one.'
  spec.homepage      = 'https://github.com/toptal/webpack-assets'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
