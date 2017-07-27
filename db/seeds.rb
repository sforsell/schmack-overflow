require 'faker'

User.delete_all
Questions.delete_all
Answers.delete_all
Votes.delete_all
Comments.delete_all

users = []

20.times do
  users << User.create(username: Faker::Pokemon.name, email: Faker::Interet.email, password: "password")
end

questions = []

users.each do | user|
    questions << Question.create(title: Faker::Twitter.status, question: Faker::TheFreshPrinceOfBelAir.quote, user: user)
end

answers = []
3.times do

  questions.each do |question|
    answers << Answer.create(user: user.sample, question: question, answer: "answer", top_answer: false)
  end
end

questions.each do |question|
  answers << Answer.create(user: user.sample, question: question, answer: "answer", top_answer: true)
end
