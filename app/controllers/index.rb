enable :sessions

get '/' do
  if session[:logged_in] == true
    redirect '/secret'
  else
    erb :index
  end
end


post '/login' do
  user = User.find_by_email(params[:sign_in][:email])
  stored_password = user.password_hash
  given_password = Digest::MD5.hexdigest(params[:sign_in][:password_hash] + user.salt)
  if stored_password == given_password
    session[:logged_in] = true
    redirect '/secret'
  else
    redirect '/'
  end
end


post '/signup' do
  User.create(create_user(params[:sign_up]))
  session[:logged_in] = true
  redirect '/secret'
end


get '/secret' do
  if session[:logged_in] == true
    erb :secret_page
  else
    redirect '/'
  end
end