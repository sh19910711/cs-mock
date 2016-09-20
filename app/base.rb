class Base < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  helpers do
    def login_user
      if user = User.find_by(login_id: session[:user_login_id])
        user
      else
        halt 404
      end
    end
  end
end
