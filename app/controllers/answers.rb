  post '/questions/:id/answers' do
    question = Question.find(params[:id])
    answer = Answer.new(user: current_user, question: question, answer: params[:answer])
    if answer.save
      redirect "/questions/#{ question.id}"
    else
      @errors = answer.errors.full_messages
      erb :'/questions/show'
    end
  end

  put '/questions/:question_id/answers/:id' do
    answer = Answer.find(params[:id])
    answer.update_attribute(:top_answer, boolean(params[:top]))
    redirect "/questions/#{params[:question_id]}"
  end
