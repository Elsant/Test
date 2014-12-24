require 'dm-validations'
require 'date'

class Order
  include DataMapper::Resource

  property :id,          Serial
  property :order_no,    String
  property :customer_id, Integer
  property :total,       Float
  property :date,        Date
  property :created_at,  DateTime, :default => DateTime.now
  property :updated_at,  DateTime, :default => DateTime.now
end