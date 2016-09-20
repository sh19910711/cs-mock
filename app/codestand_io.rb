class CodestandIO < Base
  before { session[:user_login_id] = 'myuser' }
  get('/') { slim :io_index, layout: nil }
  get('/dashboard') { slim :io_dashboard }
  get('/apps') { slim :io_apps_index }
  get('/apps/:name') { @name = params[:name]; slim :io_apps_show }
  get('/devices') { slim :io_devices }
  get('/settings') { slim :io_settings }
end
