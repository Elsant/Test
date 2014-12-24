require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-migrations'

namespace :db do
  require './config/database'

  desc "Migrate the database"
  task :migrate do
    DataMapper.auto_migrate!
  end
  
  desc "Upgrade the database"
  task :upgrade do
    DataMapper.auto_upgrade!
  end

  desc "Add some test users"
  task :seed do
    cust1 = Customer.new
    cust1.firstname = "John"
    cust1.lastname = "Smith"
    cust1.email = "john@example.com"
    cust1.password = "11111111"
    cust1.save

    cust2 = Customer.new
    cust2.firstname = "Ann"
    cust2.lastname = "Loran"
    cust2.email = "ann@example.com"
    cust2.password = "11111111"
    cust2.save
  end    
end
    
