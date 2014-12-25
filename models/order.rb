require 'dm-validations'
require 'date'

class Order
  include DataMapper::Resource

  property :id,          Serial
  property :order_no,    String
  property :total,       Float
  property :date,        Date
  property :created_at,  DateTime, :default => DateTime.now
  property :updated_at,  DateTime, :default => DateTime.now

  belongs_to :customer, :key => true

  has n, :line_items
  has n, :products, :through => :line_items
end