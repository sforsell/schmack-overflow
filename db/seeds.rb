require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Vote.delete_all
Comment.delete_all

users = []

20.times do
  users << User.create(username: Faker::Name.last_name , email: Faker::Internet.email, password: "password")
end

questions = []
users.each do | user|
    questions << Question.create(title: Faker::Hacker.say_something_smart, question: Faker::StarWars.quote, user: user)
end

answers = []
3.times do
  questions.each do |question|
    answers <<  Answer.create(user: users.sample, question: question, answer: Faker::Zelda.game, top_answer: false)
  end
end

questions.each do |question|
    answers << Answer.create(user: users.sample, question: question, answer: Faker::Zelda.game, top_answer: false)
end

 votes = [true, false]

200.times do


  Vote.create(user: users.sample, votable_id: questions.sample.id, votable_type: "Question", vote: votes.sample)
end

800.times do

  Vote.create(user: users.sample, votable_id: answers.sample.id, votable_type: "Answer", vote: votes.sample)
end

30.times do
  Comment.create(comment: Faker::StarWars.quote,user: users.sample, commentable_id: questions.sample.id, commentable_type: "Question")
end

90.times do
  Comment.create(comment: Faker::StarWars.quote,user: users.sample, commentable_id: answers.sample.id, commentable_type: "Answer")
end
