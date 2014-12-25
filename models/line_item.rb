require 'date'

class LineItem
  include DataMapper::Resource

  property :qty,         Integer, default: 1
  property :unit_price,  Float, precision: 2
  property :total_price, Float, precision: 2
  property :created_at,  DateTime, default: DateTime.now
  property :updated_at,  DateTime, default: DateTime.now
  

  belongs_to :order, :key => true
  belongs_to :product, :key => true

end