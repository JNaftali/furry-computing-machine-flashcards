get '/' do
  # @decks = Deck.all
  # erb :'index'
  redirect '/decks'
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = "Invalid username and/or password"
    erb :login
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
