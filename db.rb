# db.rb is used by config.ru and rake tasks (e.g., db:reset, db:seed)
require 'active_record'
require 'yaml'
require 'erb'

ActiveRecord::Base.logger = Logger.new(STDERR) unless ENV['RACK_ENV'] == 'production'

conf = if dburl = ENV['DATABASE_URL']
  { 'url' => dburl, 'pool' => 16 }
else
  { 'adapter' => 'sqlite3', 'database' => 'db/db.sqlite3', 'pool' => 16 }
end
ActiveRecord::Base.establish_connection(conf)

class App < ActiveRecord::Base
end

class Device < ActiveRecord::Base
end

class User < ActiveRecord::Base
  has_many :apps
end
