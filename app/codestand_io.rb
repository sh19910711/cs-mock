class CodestandIO < Base
  get '/' do
    slim :index
  end

  get '/dashboard' do
    slim :dashboard
  end
end
