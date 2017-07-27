require 'faker'

User.delete_all
Questions.delete_all
Answers.delete_all
Votes.delete_all
Comments.delete_all

users = []

20.times do
  users << User.create(name: Faker::GameOfThrones.character, email: Faker::Interet.email, password: "password")
end

questions = []

users.each do | user|
    questions << Question.create(title: Faker, question:  )
