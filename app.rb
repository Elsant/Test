require 'rubygems'
require 'sinatra'
require 'data_mapper'
require './config/database'
require './helpers/sinatra'

# Order Lines table(Shopping cart items)

enable :sessions


get '/' do
  # don't forget about title
  @customer = session[:customer]
  haml :'products/index'

end

get '/customers/signup' do
  haml :'customers/signup'
end

post '/customers/signup' do
  customer = Customer.new
  
  customer.firstname = params["firstname"]
  customer.lastname = params["lastname"]
  customer.password = params["password"]
  customer.email = params["email"]
  if customer.save
    flash("Customer created")
    redirect '/'
  else
    tmp = []
    customer.errors.each do |e|
      tmp << (e.join("<br/>"))
    end
    flash(tmp)
    redirect '/customers/signup'
  end
end

get '/customers/login' do
  haml :'customers/login'
end

post '/customers/login' do
  if session[:customer] = Customer.authenticate(params["email"], params["password"])
    flash("Login successful")
    redirect '/'
  else
    flash("Login failed - Check email and password")
    redirect '/customers/login'
  end
end

get '/customers/logout' do
  session[:customer] = nil
  flash("Logout successful")
  redirect '/'
end

