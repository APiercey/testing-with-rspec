# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'
require_relative './operations/collectives/index.rb'
require_relative './operations/collectives/show.rb'
require_relative './operations/assets/index.rb'
require_relative './operations/assets/show.rb'

module Web
  class Server < Sinatra::Base
    attr_reader :application

    def initialize(application)
      super
      @application = application
    end

    get '/assets' do
      json Web::Operations::Assets::Index
        .new(application)
        .call
    end

    get '/collectives/:id/assets' do
      json Web::Operations::Assets::Show
        .new(application)
        .call(params)
    end

    get '/collectives/:id' do
      json Web::Operations::Collectives::Show
        .new(application)
        .call(params)
    end

    get '/collectives' do
      json Web::Operations::Collectives::Index
        .new(application)
        .call
    end

    get '/' do
      'Hello world'
    end
  end
end
