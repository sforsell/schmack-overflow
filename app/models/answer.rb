class Answer < ActiveRecord::Base
  # Remember to create a migration!
  validates :answer, presence: true
  validates :user, uniqueness: { scope: :question }

  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
end
