class CodestandIO < Base
  get('/') { slim :index, layout: nil }
  get('/apps') { slim :apps }
  get('/devices') { slim :devices }
  get('/settings') { slim :settings }
end
