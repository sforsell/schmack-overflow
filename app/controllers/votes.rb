post '/questions/:id/votes' do

  question = Question.find(params[:id])
  vote = Vote.create(user: current_user, votable_id: params[:id], votable_type: "Question", vote: boolean(params[:vote]))
  if request.xhr?
    question.score.to_s
  else
    redirect "/questions/#{ question.id}"
  end
end

post '/answers/:id/votes' do
  answer = Answer.find(params[:id])
  vote = Vote.create(user: current_user, votable_id: params[:id], votable_type: "Answer", vote: boolean(params[:vote]) )
  p vote
   if request.xhr?
     answer.score.to_s
   else
     redirect "/questions/#{ answer.question_id}"
   end
end

post '/comments/:id/votes' do
  comment = Comment.find(params[:id])
  vote = Vote.create(user: current_user, votable_id: params[:id], votable_type: "Comment", vote: boolean(params[:vote]) )
  if request.xhr?
    comment.score.to_s
  else
    redirect "/questions/#{ comment.question_id}"
  end
end
