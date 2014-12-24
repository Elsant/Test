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

    prod1 = Product.new
    prod1.name = "Good Product"
    prod1.status = 1
    prod1.description = "This is a first product"
    prod1.price = 130.55
    prod1.save

    prod2 = Product.new
    prod2.name = "Famous Product"
    prod2.status = 0
    prod2.description = "This is a second product"
    prod2.price = 55.30
    prod2.save

    prod3 = Product.new
    prod3.name = "Important Product"
    prod3.status = 1
    prod3.description = "This is a third product"
    prod3.price = 193.11
    prod3.save

  end    
end
    
