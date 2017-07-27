class Question < ActiveRecord::Base
  belongs_to :user
  validates :title, :text, presence: true
  validates :user
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
end
