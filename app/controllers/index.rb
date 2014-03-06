get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sign_up' do
  erb :sign_up, layout: false
end

post '/sign_up' do
  create(params)
end

get '/login' do
  erb :login, layout: false
end

post '/login' do
  auth(params) # initializes session with user_id
end

get '/logout' do
  session.clear
  redirect '/'
end

