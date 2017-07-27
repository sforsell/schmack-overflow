get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  question = Question.new(params[:question])
  question.user = current_user
  p question
  if question.save
    redirect "/questions/#{question.id}"
  else
    @errors = question.errors.full_messages
    erb :'/questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @answers = @question.answers
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  erb :'/questions/edit'
end

put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.question = params[question][question]
  @question.question = params[question][title]
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/edit'
  end
end

delete '/questions/:id' do
  redirect '/questions'
end
