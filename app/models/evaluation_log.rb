class EvaluationLog < ApplicationRecord
  belongs_to :user
  belongs_to :evaluation
  
  belongs_to :sender, :class_name => "User"
end
