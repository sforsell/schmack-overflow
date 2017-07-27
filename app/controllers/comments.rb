post "/questions/:id/comments" do
  question = Question.find_by(id: params[:id])
  question.comments.new(user: current_user, comment: params[:comment])

  if question.save
    redirect "/questions/#{question.id}"
  else
    @errors = question.errors.full_messages
    erb :"/questions/show"
  end

end

post "/answers/:id/comments" do
  answer = Answer.find_by(id: params[:id])
  answer.comments.new(user: current_user, comment: params[:comment])

  if answer.save
    erb :"/questions/#{answer.question_id}"
  else
    @errors = answer.errors.full_messages
    erb :"/questions/#{answer.question_id}"
  end

end
