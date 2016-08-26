get '/users/new' do
  @users = User.new
  erb :'users/new'
end

post '/users' do
  @new_user = User.new(params[:new_user])
  if @new_user.save
    session[:user_id] = new_user.id
    redirect '/'
  else
    @errors = new_user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  :'users/details'
end
