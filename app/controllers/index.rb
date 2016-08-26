get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])

  #other login stuff

  if new_user.save
    session[:user_id] = new_user.id
    redirect '/'
  else
    @errors = new_user.errors.full_messages
    erb :'users/new'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
