## Install following gems

- `gem install --no-rdoc --no-ri sinatra`
- `gem install --no-rdoc --no-ri shotgun`
- `gem install --no-rdoc --no-ri datamapper`
- `gem install --no-rdoc --no-ri mysql2`
- `gem install --no-rdoc --no-ri dm-mysql-adapter`

In config /config/database.rb You must change for Your own settings like this

- `mysql://user:password@hostname:port/database`

Then You can simple put in bash

- `rake db:migrate`
- `rake db:seed`

There is also another task available

- `rake db:upgrade`

## Run

- `shotgun app.rb`
