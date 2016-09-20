class Mgmt < Base
  # returns all applications
  get '/apps' do
    { :applications => login_user.apps.all }.to_json
  end

  get '/apps/:name' do
    login_user.apps.find_by(name: params[:name]).to_json
  end

  get '/apps/:user/:name' do
    if u = User.find_by(login_id: params[:user])
      if app = u.apps.find_by(name: params[:name])
        app.to_json
      else
        halt 404
      end
    else
      halt 404
    end
  end

  # creates new application
  post '/apps' do
    login_user.apps.create(:name => params[:name])
    { :msg => 'ok' }.to_json
  end

  # returns all devices
  get '/devices' do
    @devices = Device.all
    { :devices => @devices }.to_json
  end
end
