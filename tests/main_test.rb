ENV['RACK_ENV'] = 'test'

  
require 'main'
require 'test/unit'
require 'rack/test'

require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'sinatra'
require 'test/unit'
require 'rack/test'
require 'base64'
require 'json'
require 'timecop'
require 'sinatra/cross_origin'
require './main'

class ApplicationTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

# TODO add tests, and start form here

end
