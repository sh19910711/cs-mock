class Auth < Base
  get('/login') { slim :auth_login, :layout => :layout_nosidebar }
  get('/register') { slim :auth_register, :layout => :layout_nosidebar }
  get('/logout') { redirect '/' }
end
