require 'date'

class LineItem
  include DataMapper::Resource

  property :id,          Serial 
  property :order_id,    Integer
  property :product_id,  Integer
  property :qty,         Integer
  property :unit_price,  Float
  property :total_price, Float
  property :created_at,  DateTime, :default => DateTime.now
  property :updated_at,  DateTime, :default => DateTime.now
  

  belongs_to :order, :key => true
  belongs_to :product, :key => true

end