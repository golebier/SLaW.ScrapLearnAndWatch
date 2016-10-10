# encoding: UTF-8

require 'json'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'
require 'sinatra/cross_origin'

configure :development do
  set :datamapper_url, "sqlite3://#{File.dirname(__FILE__)}/data.sqlite3"
end

configure :test do
  set :datamapper_url, "sqlite3://#{File.dirname(__FILE__)}/data.sqlite3"
end

configure :production do
#  set :datamapper_url, "mongodb://mongodb:12345@localhost/sinatra_service"
  set :datamapper_url, "sqlite3://#{File.dirname(__FILE__)}/data.sqlite3"
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

require './data/init'
require './lib/init'
require './app/init'

DataMapper.auto_upgrade!

DataMapper.finalize
