require 'dm-validations'
require 'date'

class Order
  include DataMapper::Resource

  property :id,          Serial
  property :order_no,    String
  property :total,       Float
  property :date,        Date
  property :created_at,  DateTime, default: DateTime.now
  property :updated_at,  DateTime, default: DateTime.now

  belongs_to :customer, :key => true

  has n, :line_items
  has n, :products, :through => :line_items

  # def current_order
  #   order = Order.first(session[:order_id])
  #   return order unless order.nil?
  #   order = Order.create
  #   order.customer_id = @customer.id
  #   order.save
  #   session[:order_id] = order.id
  #   order
  # end

  def add_product(product_id)
    current_item = line_items.first(:product_id => product_id) 
    if current_item
      current_item.qty += 1
    else
      current_item = []
      current_item << line_items.new(:product_id => product_id)
    end
    current_item
  end

end