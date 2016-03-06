post "/sessions" do
  @user = User.find_by(username: params[:username])
  if @user && @user.password_hash == params[:password_hash]
    session[:user] = @user.id
    redirect "/"
  else
    @error = "The information given does not match our records"
    erb :"users/login"
  end
end

get "/sessions/logout" do
  session.clear
  redirect "/"
end

