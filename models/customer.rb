require './helpers/helpers'
require 'digest/sha1'
require 'dm-validations'
require 'date'

class Customer
  include DataMapper::Resource

  #all fields required
  property :id,               Serial 
  property :firstname,        String
  property :lastname,         String
  property :email,            String, :key => true
  property :hashed_password,  String
  property :salt,             String 
  property :created_at,       DateTime,  :default => DateTime.now

  attr_accessor :password

  validates_presence_of :firstname, :lastname, :email, :password
  validates_format_of :email, :as => :email_address
  validates_length_of :password, :min => 7

  def password=(pass)
    @password = pass
    self.salt = Helpers::random_string(10) unless self.salt
    self.hashed_password = Customer.encrypt(@password, self.salt)
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass + salt)
  end
  
  def self.authenticate(email, pass)
    customer = Customer.first(:email => email)
    return nil if customer.nil?
    return customer if Customer.encrypt(pass, customer.salt) == customer.hashed_password
    nil
  end

end