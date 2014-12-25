require 'dm-validations'
require 'date'
require './models/line_item'

class Order
  include DataMapper::Resource

  property :id,          Serial
  property :order_no,    String
  # property :customer_id, Integer
  property :total,       Float
  property :date,        Date
  property :created_at,  DateTime, :default => DateTime.now
  property :updated_at,  DateTime, :default => DateTime.now

  belongs_to :customer, :key => true

  has n, :line_items
  has n, :products, :through => :line_items
end