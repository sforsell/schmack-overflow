class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments

  validates :username, :email, :password, presence: true
  validates :email, :username, uniqueness: true

  has_secure_password
end
