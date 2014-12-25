require 'rubygems'
require 'sinatra'
require 'data_mapper'
require './config/database'
require './helpers/sinatra'


enable :sessions

before do
  @customer = session[:customer]
end

get '/' do
  redirect :'products'
end


# **** Customers ******

get '/customers/signup' do
  haml :'customers/signup'
end

post '/customers/signup' do
  @customer = Customer.new
  
  @customer.firstname = params["firstname"]
  @customer.lastname = params["lastname"]
  @customer.password = params["password"]
  @customer.email = params["email"]
  if @customer.save
    flash("Customer created")
    redirect '/'
  else
    tmp = []
    @customer.errors.each do |e|
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

# ****  End of Customers ******

# **** Products ******

get '/products/new' do
  haml :'products/new'
end

post '/products' do
  @product = Product.new
 
  @product.name = params["name"]
  @product.description = params["description"]
  @product.status = params["status"].to_i
  @product.price = params["price"].to_f
  if @product.save
    flash("Product created")
    redirect '/products'
  else
    tmp = []
    @product.errors.each do |e|
      tmp << (e.join("<br/>"))
    end
    flash(tmp)
    redirect '/products/new'
  end
end

get '/products' do
  @products = Product.all
  haml :'products/index'
end


get '/products/:id' do
  @product = Product.get(params[:id])
  haml :'products/show'
end

get '/products/:id/edit' do
  @product = Product.get(params[:id])
  haml :'products/edit'
end

# must be put '/products/:id'
post '/products/:id/update' do
  @product = Product.get(params[:id])

  @product.name = params["name"]
  @product.description = params["description"]
  @product.status = params["status"].to_i
  @product.price = params["price"].to_f
  if @product.save
    flash("Product updated")
    redirect "/products/#{@product.id}"
  else
    tmp = []
    @product.errors.each do |e|
      tmp << (e.join("<br/>"))
    end
    flash(tmp)
    redirect '/products/"#{@product.id}"/edit'
  end
end

# must be delete '/products/:id'
# maybe must been destroyed if logged_in? or admin?
get '/products/:id/delete' do
  @product = Product.get(params[:id])
  @product.destroy
  redirect '/products'
end

# ****  End of Products ******

# ****  Orders ******
