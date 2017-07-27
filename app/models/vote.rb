class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :votable_type, uniqueness: { scope: [:votable_id, :user] }
end
