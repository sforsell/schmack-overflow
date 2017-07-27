class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :title, :question, :user, presence: true

  def score
    self.votes.where(vote: true).count - self.votes.where(vote: false).count
  end
end
