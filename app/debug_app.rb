class DebugApp < Base
  configure :development do
    get('/routes') { slim :debug_routes, layout: nil }
  end
end
