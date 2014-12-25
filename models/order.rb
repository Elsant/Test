require 'dm-validations'
require 'date'

class Order
  include DataMapper::Resource

  property :id,          Serial
  property :order_no,    String
  property :total,       Float, precision: 2
  property :date,        Date
  property :created_at,  DateTime, default: DateTime.now
  property :updated_at,  DateTime, default: DateTime.now

  belongs_to :customer, :key => true

  has n, :line_items
  has n, :products, :through => :line_items

  def add_product(product_id)
    current_item = line_items.first(:product_id => product_id) 
    if current_item
      current_item.qty += 1
    else
      current_item = line_items.new(:product_id => product_id)
    end
    current_item
  end

end