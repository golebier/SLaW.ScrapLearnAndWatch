ENV['RACK_ENV'] = 'test'

require 'main'
#require 'test/unit'
#require 'rack/test'
#
#require 'simplecov'
#SimpleCov.start
#
require 'rubygems'
require 'sinatra'
require 'test/unit'
require 'rack/test'
require 'base64'
require 'json'
require 'timecop'
require 'sinatra/cross_origin'
require './main'

#class ApplicationTest < MiniTest::Unit::TestCase
#  include Rack::Test::Methods
#
#  def app
#    Sinatra::Application
#  end
#
## TODO add tests, and start form here
#
#end

require 'bacon'
require 'rack/test'


# TODO BegineClass clean DB

describe 'The ScrapFetchAndLearn App' do
  extend Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "list empty content" do
    get '/api/all_content'
    last_response.should.be.ok
    last_response.body.should.equal '[]'
  end

  it "list empty content sources" do
    get '/api/all_content_sources'
    last_response.should.be.ok
    last_response.body.should.equal '[]'
  end

  it "add a content parts: name" do
    content = Content.create(
      name: "aaaa"
    )
    post '/api/contents', content.to_json
    last_response.should.be.ok
#    print last_response.body #.should.constants '"name":"aaa","s":null,"e":null,"sourceURL":null,"contentURL":null,"used":false'    
  end

  it "add a content source" do
    content = ContentSources.create(
          name: "aaaa"
        )
    post '/api/sources', content.to_json
    last_response.should.be.ok
#    last_response.body.should.equal '[]'
  end
end

# lambda { |obj| obj.size < max_size }
