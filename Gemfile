# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.1'

gem 'rake'

gem 'puma'
gem 'sinatra'
gem 'sinatra-contrib'

gem 'activerecord'

if dburl = ENV['DATABASE_URL']
  case URI.parse(dburl).scheme
  when 'mysql'; gem 'mysql2'
  when 'postgres'; gem 'pg'
  end
else
  gem 'sqlite3'
end

gem 'slim'
gem 'sass'
gem 'coffee-script'
