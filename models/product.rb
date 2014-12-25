require 'dm-validations'
require 'date'
# require './models/line_item'

class Product
  include DataMapper::Resource

  #all fields required
  property :id,          Serial 
  property :name,        String
  property :price,       Float
  property :status,      Integer, :default => 0
  property :description, String
  property :created_at,  DateTime, :default => DateTime.now
  property :updated_at,  DateTime, :default => DateTime.now
  
  validates_presence_of :name, :price, :description 

  has n, :line_items
  has n, :orders, :through => :line_items

end