require_relative 'db'

namespace :db do
  task :init => [:reset, :seed]

  task :reset => ['reset:all']
  namespace :reset do
    task :all => [:drop_tables, :create_tables]
    
    task :drop_tables do
      ActiveRecord::Base.logger = Logger.new(STDERR)
      con = ActiveRecord::Base.connection
      con.tables.each {|t| con.drop_table(t) }
    end

    task :create_tables do
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
    end
  end

  task :seed => 'seed:all'
  namespace :seed do
    task :all => [:users, :devices]

    task :users do
      User.create(login_id: 'bob', name: 'Bob') { |u| u.apps.new(name: 'oh-my-app') }
      User.create(login_id: 'alice', name: 'Alice')
      User.create(login_id: 'merry', name: 'Merry') { |u| u.apps.new(name: 'awesome-iot-app') }
      User.create(login_id: 'myuser', name: 'My User') do |u|
        [
          { :name => 'plus-one-button', },
          { :name => 'plus-one-counter', },
          { :name => 'my-first-app', },
          { :name => 'another-app', },
          { :name => 'awesome-app', },
          { :name => 'example-app', },
        ].each { |a| u.apps.new(a) }
      end
    end

    task :devices do
      [
        { name: 'my-home-rpi3', board: 'rpi3', status: 'running' },
        { name: 'my-lab-rpi3', board: 'rpi3', status: 'down' },
        { name: 'mitoh-esp8266', board: 'esp8266', status: 'ready' },
      ].each { |d| Device.create(d) }
    end
  end
end
