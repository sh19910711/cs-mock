class CodestandIO < Base
  get('/') { slim :io_index, layout: nil }
  get('/dashboard') { slim :io_dashboard }
  get('/apps') { slim :io_apps }
  get('/devices') { slim :io_devices }
  get('/settings') { slim :io_settings }
end
