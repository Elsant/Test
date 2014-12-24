require 'dm-validations'
require 'date'

class Product
  include DataMapper::Resource

  #all fields required
  property :id,          Serial 
  property :name,        String
  property :price,       Float
  property :status,      Integer #Enabled disabled 1
  property :description, String
  property :created_at,  DateTime, :default => DateTime.now
  property :updated_at,  DateTime, :default => DateTime.now

  validates_presence_of :name, :price, :status, :description 
end