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
require_relative 'app/auth'
require_relative 'app/mgmt'
require_relative 'app/debug_app'

# routes
map('/') { run CodestandIO }
map('/auth') { run Auth }
map('/mgmt') { run Mgmt }
map('/debug') { run DebuApp}
