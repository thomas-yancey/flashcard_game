get "/users/new" do
  erb :"users/new"
end

post "/users" do
  @user = User.create(params[:user])
  redirect "/users/#{@user.id}"
end

get "/users/:id/edit" do
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

