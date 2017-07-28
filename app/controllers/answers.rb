  post '/questions/:id/answers' do
    @question = Question.find(params[:id])
    answer = Answer.new(user: current_user, question: @question, answer: params[:answer])
    if request.xhr?
      if answer.save
        erb :'/partials/_answer_post', locals: { answer: answer, question: @question }, layout: false
      end
    else
      redirect "/questions/#{ @question.id}"
    end
  end

  put '/questions/:question_id/answers/:id' do
    answer = Answer.find(params[:id])
    answer.update_attribute(:top_answer, boolean(params[:top]))
    redirect "/questions/#{params[:question_id]}"
  end
