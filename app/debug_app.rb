class DebugApp < Base
  configure :development do
    get('/routes') { slim :routes, layout: nil }
  end
end
