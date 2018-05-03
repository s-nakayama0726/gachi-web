class Evaluation < ApplicationRecord
  has_many :evaluation_logs
  has_many :users, through: :evaluation_logs
  
  BAD_EVALUATION = 0
  GOOD_EVALUATION = 1
  
  def self.save_good_evaluation(target_user_id, sender_id)
    evaluation = Evaluation.find_by(:evaluation_param => GOOD_EVALUATION)
    evaluation_log = evaluation.evaluation_logs.build
    evaluation_log.user_id = target_user_id.to_i
    evaluation_log.sender_id = sender_id.to_i
    
    evaluation_log.log_message = "「推せるわ」が届きました"
    evaluation_log.save 
  end
  
  def self.save_bad_evaluation(target_user_id, sender_id)
    evaluation = Evaluation.find_by(:evaluation_param => BAD_EVALUATION)
    evaluation_log = evaluation.evaluation_logs.build
    evaluation_log.user_id = target_user_id.to_i
    evaluation_log.sender_id = sender_id.to_i
    
    sender_user_name = User.find_by_id(sender_id).name
    evaluation_log.log_message = "「推せねーわ」が届きました"
    evaluation_log.save 
  end
  
end
