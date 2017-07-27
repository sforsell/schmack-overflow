get "users/new" do
  erb :"/users/new"
end

get "/users/:id" do
  if params[:id] == current_user.id
    erb :'/users/show'
  else
    redirect "/questions"
  end
end

post "/users" do
  user = User.new(params[:user])
  if user.save
    redirect "/user/#{user_id}"
    session[:user_id] = user.id
  else
    @errors = user.errors.full_messages
    erb :"users/new"
  end
end

