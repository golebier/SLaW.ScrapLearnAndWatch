# encoding: UTF-8

require 'json'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'
require 'sinatra/cross_origin'

configure :development do
  set :datamapper_url, "sqlite3://#{File.dirname(__FILE__)}/company.sqlite3"
end

configure :test do
  set :datamapper_url, "sqlite3://#{File.dirname(__FILE__)}/company.sqlite3"
end

configure :production do
#  set :datamapper_url, "mongodb://mongodb:12345@localhost/sinatra_service"
  set :datamapper_url, "sqlite3://#{File.dirname(__FILE__)}/company.sqlite3"
end

configure :production_mysql do
  set :datamapper_url, "mysql://root:12345@localhost/sinatra_service"
end

configure :production_postgres do
  set :datamapper_url, "postgres://postgres:12345@localhost/sinatra_service"
end

before do
  content_type 'application/json'
end

configure do
  enable :cross_origin
end

set :protection, :except => [:http_origin]
use Rack::Protection::HttpOrigin, :origin_whitelist => ['http://192.168.1.100:9292']

DataMapper.setup(:default, settings.datamapper_url)

# TODO
#require './data/init'
#require './lib/init'
#require './app/init'

#DataMapper.finalize

## Tell DataMapper to update the database according to the definitions above.
DataMapper.auto_upgrade!

DataMapper.finalize

#hold data betwin runs

# If there are no Things in the database, add a few.
#if Company.count == 0
#  directorylist = `ls ~`
#  
#  directorylist.each do |filename|
#    print filename
#    Company.create(:name => filename, :watched_counter => "0")
#  end
#end

# stdout, stderr, status = Open3.capture3('nroff -man', :stdin_data => stdin)
#directorylist = %x[find . -name '*test.rb' | sort]

#directorylist.each do |filename|
#  #filename.chomp!
#  # work with file
#  print filename
#end
