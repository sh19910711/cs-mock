require 'sinatra'
require 'slim'
require 'sass'
require 'json'
if development?
  require 'sinatra/reloader'
end

# load apps
require_relative 'app/base'
require_relative 'app/codestand_io'
require_relative 'app/mgmt'

# routes
map('/') { run CodestandIO }
map('/mgmt') { run Mgmt }
