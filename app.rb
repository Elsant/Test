require 'rubygems'
require 'sinatra'
require 'data_mapper'


# DataMapper::Logger.new($stdout, :debug)
# mysql://user:password@hostname/database
DataMapper.setup(:default, 'mysql://root:5555@localhost:3306/test')

class Product
  include DataMapper::Resource

  #all fields required
  property :id,          Serial 
  property :name,        String
  property :price,       Float
  property :status,      Integer #Enabled disabled 1
  property :description, String
  property :created_at,  DateTime
  property :updated_at,  DateTime

  validates_presence_of :name, :price, :status, :description 
end

class Customer
  include DataMapper::Resource

  #all fields required
  property :id,         Serial 
  property :firstname,  String
  property :lastname,   String
  property :email,      String
  property :password,   String 
  property :created_at, DateTime
  property :updated_at, DateTime

  validates_presence_of :firstname, :lastname, :email, :password
  validates_format_of :email, :as => :email_address
  validates_length_of :password, :min => 7
end

class Order
  include DataMapper::Resource

  property :id,          Serial
  property :order_no,    String
  property :customer_id, Integer
  property :total,       Float
  property :date,        Date
  property :created_at,  DateTime
  property :updated_at,  DateTime #dont forget timestamps
end

# Order Lines table(Shopping cart items)

# DataMapper.auto_migrate! # !Dangerous
# DataMapper.auto_upgrade!

get '/' do
  erb 'Hello'
end
