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
require 'main'

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
#  Content.property(:name, Text, :required => false)
#  Content.property(:s, Text, :required => false)
#  Content.property(:e, Text, :required => false)
#  Content.property(:sourceURL, Text, :required => false)
#  Content.property(:contentURL, Text, :required => false)


#    company = {
#	           "name" => "company name",
#		          "address" => "company address",
#			         "city" => "company city",
#				        "country" => "company country"
#					    }
#        post '/api/companies', company.to_json
#	    assert_equal 201, last_response.status



  it "add a content parts: name" do
    content = Content.create(
      name: "aaaa"
    )
    post '/api/content', content.to_json
#    get '/api/all_content_sources'
#    last_response.should.be.ok
#    last_response.body.should.equal '[]'    
  end
  
#  it "add a content" do
#    content = Content.create(
#      name: 'NG',
#      s: 's01',
#      e: 'e01',
#      sourceURL: 'https://test.tst/test/test.html',
#      contentURL: 'https://test.tst/test/NG-s01e01-x83-djd2.html'
#    )
#    post '/api/content', content.to_json
#
##    last_response.should.be.ok
#    last_response.body.should.equal '[]'
#  end

#  it "add a content source" do
#    get '/api/all_content_sources'
#    last_response.should.be.ok
#    last_response.body.should.equal '[]'
#  end
end

# lambda { |obj| obj.size < max_size }
