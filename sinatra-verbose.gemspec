# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra/verbose/version'

Gem::Specification.new do |spec|
  spec.name          = 'sinatra-verbose'
  spec.version       = Sinatra::Verbose::VERSION
  spec.authors       = ['Patricio Mac Adden']
  spec.email         = ['patriciomacadden@gmail.com']
  spec.description   = 'Sinatra verbose logging extension'
  spec.summary       = 'Sinatra verbose logging extension'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sinatra'

  spec.add_runtime_dependency 'sinatra'
end
