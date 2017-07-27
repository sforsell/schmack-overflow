get '/' do
  "Hello World"
end

#CONTACTS RESTful actions


#index
get '/contacts' do
  @contacts = Contact.all
  erb :'/contacts/index'
end

#new
get '/contacts/new' do
  @contact = Contact.new
  erb :'contacts/new'
end

#create
post '/contacts' do
  puts params
  @contact = Contact.create(params[:contact])
  if @contact.valid?
    redirect '/contacts'
  else
    status 422
    @errors = @contact.errors.full_messages
    erb :'contacts/new'
  end
end

#show
get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :'contacts/show'
end

#edit
get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

#update
def update_contact
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
  if @contact.valid?
    redirect "/contacts/#{@contact.id}"
  else
    status 422
    @errors = @contact.errors.full_messages
    erb :'contacts/edit'
  end
end

patch '/contacts/:id' do
  update_contact
end

put '/contacts/:id' do
  update_contact
end

#delete
delete '/contacts/:id' do
  @contact = Contact.find(params[:id]).destroy!
  redirect '/contacts'
end
