require 'sinatra'
require 'slim'
require 'sass'
require 'json'
require 'sinatra/reloader' if development?

require_relative 'db'
require_relative 'app/base'
require_relative 'app/codestand_io'
require_relative 'app/auth'
require_relative 'app/mgmt'
require_relative 'app/debug_app'

map('/') { run CodestandIO }
map('/auth') { run Auth }
map('/mgmt') { run Mgmt }
map('/debug') { run DebugApp }
