require 'sinatra/verbose/version'

module Sinatra
  # = Sinatra::Verbose
  #
  # Extension to log verbosely. Useful during development, since
  # it will automatically log all the blocks that are invoked.
  #
  # == Usage
  #
  # === Classic Application
  #
  # To enable the verbose logger in a classic application all you need to do is
  # require it:
  #
  #     require "sinatra"
  #     require "sinatra/verbose" if development?
  #
  #     # Your classic application code goes here...
  #
  # === Modular Application
  #
  # To enable the verbose logger in a modular application all you need to do is
  # require it, and then, register it:
  #
  #     require "sinatra/base"
  #     require "sinatra/verbose"
  #
  #     class MyApp < Sinatra::Base
  #       configure :development do
  #         register Sinatra::Verbose
  #       end
  #
  #       # Your modular application code goes here...
  #     end
  #
  module Verbose
    def before(path = nil, options = {}, &block)
      blk, block = block, Proc.new do
        logger.info "passing through a before block at #{blk.source_location.join(':')}"
        blk.call
      end
      super path, options, &block
    end

    def after(path = nil, options = {}, &block)
      blk, block = block, Proc.new do
        logger.info "passing through an after block at #{blk.source_location.join(':')}"
        blk.call
      end
      super path, options, &block
    end

    def error(*codes, &block)
      blk, block = block, Proc.new do
        logger.info "passing through an error block at #{blk.source_location.join(':')}"
        blk.call
      end
      super codes, &block
    end
  end

  module VerboseTemplates
    %w(erb haml builder liquid markaby nokogiri slim wlang).each do |lang|
      define_method lang do |template, options = {}, locals = {}, &block|
        logger.info "rendering #{template}.#{lang}"
        super template, options, locals, &block
      end
    end

    %w(erubis sass scss less stylus markdown textile rdoc radius coffee creole yajl rabl).each do |lang|
      define_method lang do |template, options = {}, locals = {}|
        logger.info "rendering #{template}.#{lang}"
        super template, options, locals
      end
    end
  end

  Sinatra::Base.send :include, VerboseTemplates
  register Verbose
end
