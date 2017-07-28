post '/questions/:id/votes' do
  question = Question.find(params[:id])
  vote = Vote.create(user: current_user, votable_id: params[:id], votable_type: "Question", vote: boolean(params[:vote]))
    p params[:vote]
  redirect "/questions/#{ question.id}"
end

post '/answers/:id/votes' do
  answer = Answer.find(params[:id])
  vote = Vote.create(user: current_user, votable_id: params[:id], votable_type: "Answer", vote: boolean(params[:vote]) )
    p params[:vote]
  redirect "/questions/#{ answer.question_id}"
end

post '/comments/:id/votes' do
  comment = Comment.find(params[:id])
  vote = Vote.create(user: current_user, votable_id: params[:id], votable_type: "Comment", vote: boolean(params[:vote]) )
  p params[:vote]
  redirect "/questions/#{ comment.question_id}"
end
