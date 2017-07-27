class Question < ActiveRecord::Base
  belongs_to :user
  validates :title, :text, presence: true
  validates :user
end
