class ActivityLog < ApplicationRecord
  belongs_to :user
  
  def save_activity_log(log_message)
    self.log_message = log_message
    self.save
  end
end
