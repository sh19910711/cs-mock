class Mgmt < Base
  DEFAULT_APPS = [
    { :name => 'my-app', },
    { :name => 'another-app', },
    { :name => 'awesome-app', },
  ]
  before { @apps ||= DEFAULT_APPS }

  # returns all applications
  get '/apps' do
    { :applications => @apps }.to_json
  end
end
