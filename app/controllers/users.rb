get "/users/new" do
  erb :"users/new"
end

post "/users" do
  @user = User.new(params[:user])
  @user.password = params[:password] unless params[:password].empty?

  if @user.save
    session[:user] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end

get "/users/:id/edit" do

  redirect "/" unless logged_in?
  @user = User.find_by(id: params[:id])
  erb :"users/edit"
end

get "/users/login" do
  erb :"users/login"
end


get "/users/:id" do
  @user = User.find_by(id: params[:id])
  erb :"users/show"
end

