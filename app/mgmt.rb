class Mgmt < Base
  DEFAULT_APPS = [
    { :name => 'plus-one-button', },
    { :name => 'plus-one-counter', },
    { :name => 'my-first-app', },
    { :name => 'another-app', },
    { :name => 'awesome-app', },
    { :name => 'example-app', },
  ]

  DEFAULT_DEVICES = [
    { name: 'my-home-rpi3', board: 'rpi3', status: 'running' },
    { name: 'my-lab-rpi3', board: 'rpi3', status: 'down' },
    { name: 'mitoh-esp8266', board: 'esp8266', status: 'ready' },
  ]
  
  before do
    @apps ||= DEFAULT_APPS
    @devices ||= DEFAULT_DEVICES
  end
  
  # returns all applications
  get '/apps' do
    { :applications => @apps }.to_json
  end

  # creates new application
  post '/apps' do
    @apps << { :name => params[:name] }
  end

  # returns all devices
  get '/devices' do
    { :devices => @devices }.to_json
  end
end
