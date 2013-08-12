require 'minitest_helper'

describe Sinatra::Verbose do
  include Rack::Test::Methods

  def app
    Rack::Lint.new(@app)
  end

  it 'must log on after filters blocks' do
    mock_app do
      enable :logging
      register Sinatra::Verbose

      after { 'do something' }
      get('/') { 'GET /' }
    end

    get '/'
    last_response.must_be :ok?
    last_response.body.must_equal 'GET /'
    last_response.errors.must_match /passing through an after block/
  end

  it 'must log on before filters blocks' do
    mock_app do
      enable :logging
      register Sinatra::Verbose

      before { 'do something' }
      get('/') { 'GET /' }
    end

    get '/'
    last_response.must_be :ok?
    last_response.body.must_equal 'GET /'
    last_response.errors.must_match /passing through a before block/
  end

  it 'must log on error blocks' do
    mock_app do
      disable :raise_errors
      enable :logging
      register Sinatra::Verbose

      error { 'do something' }
      get('/') { raise 'Error!' }
    end

    get '/'
    last_response.status.must_equal 500
    last_response.errors.must_match /passing through an error block/
  end

  it 'must log when rendering' do
    mock_app do
      enable :logging
      register Sinatra::Verbose

      get('/') { erb '<%= "hello sinatra-contrib!" %>' }
    end

    get '/'
    last_response.must_be :ok?
    last_response.body.must_equal 'hello sinatra-contrib!'
    last_response.errors.must_match /rendering <%= "hello sinatra-contrib!" %>.erb/
  end
end
