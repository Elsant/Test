require 'dm-core'
require './models/customer'
require './models/product'
require './models/order'

# DataMapper.setup(:default, "sqlite3:///#{Dir.pwd}/test.db")
# DataMapper::Logger.new($stdout, :debug)

#Change it for Your own settings mysql://user:password@hostname:port/database
DataMapper.setup(:default, 'mysql://root:5555@localhost:3306/test')