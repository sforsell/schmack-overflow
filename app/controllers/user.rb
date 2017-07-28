get "/users/new" do
  erb :"/users/new"
end

get "/users/:id" do
  if params[:id] == current_user.id.to_s
    erb :'/users/show'
  else
    redirect "/questions"
  end
end

post "/users" do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"

  else
    @errors = user.errors.full_messages
    erb :"users/new"
  end
end

