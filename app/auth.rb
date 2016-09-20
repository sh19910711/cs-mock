class Auth < Base
  get('/login') { slim :auth_login, :layout => :layout_nosidebar }
  post('/login') {
    session[:user_login_id] = params['user.id']
    redirect '/dashboard'
  }
  get('/register') { slim :auth_register, :layout => :layout_nosidebar }
  get('/logout') { session.clear; redirect '/' }
end
