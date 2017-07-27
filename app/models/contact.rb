class Contact < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
