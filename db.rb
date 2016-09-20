require 'active_record'
require 'yaml'
require 'erb'

if ENV['RACK_ENV'] == 'development'
  ActiveRecord::Base.logger = Logger.new(STDERR)
end

# config
conf = YAML.load <<EOF
development:
  adapter: sqlite3
  database: db/development
test:
  adapter: sqlite3
  database: db/test
EOF
conf['production'] = {
  'url' => ENV['DATABASE_URL']
}

# connect database
env_conf = conf[ENV['RACK_ENV'] || 'development']
FileUtils.rm env_conf['database'] if File.exists?(env_conf['database'] || '')
ActiveRecord::Base.establish_connection(env_conf)

ActiveRecord::Schema.define do
  create_table :apps do |t|
    t.string :name
    t.belongs_to :user
  end

  create_table :devices do |t|
    t.string :name
    t.string :board
    t.string :status
  end

  create_table :users do |t|
    t.string :login_id
    t.string :name
  end
end

class App < ActiveRecord::Base
end

class Device < ActiveRecord::Base
end

class User < ActiveRecord::Base
  has_many :apps
end

User.create(login_id: 'bob', name: 'Bob').apps.create(name: 'oh-my-app')
User.create(login_id: 'alice', name: 'Alice')
User.create(login_id: 'merry', name: 'Merry').apps.create(name: 'awesome-iot-app')

myuser = User.create(login_id: 'myuser', name: 'My User')
DEFAULT_APPS = [
  { :name => 'plus-one-button', },
  { :name => 'plus-one-counter', },
  { :name => 'my-first-app', },
  { :name => 'another-app', },
  { :name => 'awesome-app', },
  { :name => 'example-app', },
].each { |a| myuser.apps.create(a) }

DEFAULT_DEVCIES = [
  { name: 'my-home-rpi3', board: 'rpi3', status: 'running' },
  { name: 'my-lab-rpi3', board: 'rpi3', status: 'down' },
  { name: 'mitoh-esp8266', board: 'esp8266', status: 'ready' },
].each { |d| Device.create(d) }
