require 'dm-migrations'

desc "List all apps for this application"
task :app do
  puts `grep '^[get|post|put|delete].*do$' app/*.rb | sed 's/ do$//'`
end

desc "auto migrates the database"
task :migrate do
  require './main'
  DataMapper.auto_migrate!
end

desc "auto upgrades the database"
task :upgrade do
  require './main'
  DataMapper.auto_upgrade! 
end

# after tests
#Rake::Task["db:test:prepare"].enhance do
#  Rake::Task["db:test:purge"].invoke
#end
