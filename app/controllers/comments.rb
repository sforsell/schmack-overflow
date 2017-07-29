post "/questions/:id/comments" do
  @question = Question.find_by(id: params[:id])
  comment = @question.comments.new(user: current_user, comment: params[:comment])

  if comment.save
    redirect "/questions/#{@question.id}"
  else
    @errors = comment.errors.full_messages
    erb :"/questions/show"
  end

end

post "/answers/:id/comments" do
  @answer = Answer.find_by(id: params[:id])
  comment = @answer.comments.new(user: current_user, comment: params[:comment])
  @question = Question.find(@answer.question_id)

  if comment.save
    redirect "/questions/#{@answer.question_id}"
  else
    @errors = comment.errors.full_messages
    erb :"/questions/show"
  end

end
