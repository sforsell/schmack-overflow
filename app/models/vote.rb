class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :voteable_type, uniqueness: { scope: :voteable_id, :user  }
end
