class Answer < ActiveRecord::Base
  # Remember to create a migration!
  validates :answer, presence: true
  validates :user, uniqueness: { scope: :question }

  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  def score
    self.votes.where(vote: true).count - self.votes.where(vote: false).count
  end
end
