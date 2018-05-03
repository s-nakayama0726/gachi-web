class Event < ApplicationRecord
  has_many :attends
  has_many :users, through: :attends
  
  def is_attended?(user_id)
    if self.users && self.users.find_by_id(user_id)
      return true
    else 
      return false
    end
  end
end
