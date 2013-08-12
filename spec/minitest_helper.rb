ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'sinatra'
require 'sinatra/verbose'
require 'rack/test'

def mock_app(base = Sinatra::Base, &block)
  @app = Sinatra.new(base, &block)
end
