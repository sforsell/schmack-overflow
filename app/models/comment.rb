class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

  validates :comment, :user_id, :commentable_id, :commentable_type, presence: true

    def question_id
      if self.commentable_type == "Question"
        return self.commentable.id
      else
        self.commentable.question_id
      end
    end

    def score
      self.votes.where(vote: true).count - self.votes.where(vote: false).count
    end
end
