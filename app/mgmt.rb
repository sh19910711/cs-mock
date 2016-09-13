class Mgmt < Base
  DEFAULT_APPS = [
    { :name => 'plus-one-button', },
    { :name => 'plus-one-counter', },
    { :name => 'my-first-app', },
    { :name => 'another-app', },
    { :name => 'awesome-app', },
    { :name => 'example-app', },
  ]
  before { @apps ||= DEFAULT_APPS }

  # returns all applications
  get '/apps' do
    { :applications => @apps }.to_json
  end

  # creates new application
  post '/apps' do
    @apps << { :name => params[:name] }
  end
end
