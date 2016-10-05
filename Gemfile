source 'https://rubygems.org'

gem 'sinatra'
gem 'json'
gem 'data_mapper'
#gem 'dm-mongodb-adapter'
gem 'sinatra-contrib'
gem 'dm-core'
gem 'dm-validations'
gem 'dm-timestamps'
gem 'dm-migrations'
gem 'sinatra-cross_origin'

# When developing an app locally you can use SQLite which is a relational
# database stored in a file. It's easy to set up and just fine for most
# development situations.
group :development, :test do
  gem 'dm-sqlite-adapter'
  gem 'byebug' #    gem 'debugger'
  gem 'timecop'
  gem 'simplecov'

  gem 'capybara'
  gem 'webrat'
#  gem 'test::spec'
  gem 'bacon'
  gem 'rspec'
#  gem ''
end

# Heroku uses Postgres however, so we tell the Gemfile to use Postgres
# in production instead of SQLite.
group :production do
#  gem 'dm-postgres-adapter'
  gem 'dm-sqlite-adapter'
end


