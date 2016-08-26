get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = "Invalid username and/or password"
    erb :'users/new'
  end
end

get '/users/:id' do
  :'users/details'
end
