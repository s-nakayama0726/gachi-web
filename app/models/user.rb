require "open-uri"

class User < ApplicationRecord
  
  has_many :attends
  has_many :events, through: :attends
  
  has_many :evaluation_logs
  has_many :users, through: :evaluation_logs
  
  has_many :label_sets
  has_many :labels, through: :label_sets
  
  has_many :senders, :class_name => "EvaluationLog", :foreign_key => "sender"
  
  has_many :activity_logs

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:extra][:raw_info][:name]
    create_flg = 0
    
    prof_image_url = auth[:info][:image]
    prof_image = open(prof_image_url)

    user = self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
      user.favorite = "ガチ恋ガーデン"
      user.prof_image = prof_image.read
      create_flg = 1
    end
    
    if create_flg == 1
    	user.activity_logs.build.save_activity_log("ガチメイトになりました！ようこそ！")
    end
    
    return user;
  end

  def get_good_evaluation_count
    self.evaluation_logs.where(:evaluation_id => Evaluation.find_by(:evaluation_param => Evaluation::GOOD_EVALUATION).id).size if self.evaluation_logs
  end
  
  def get_bad_evaluation_count
    self.evaluation_logs.where(:evaluation_id => Evaluation.find_by(:evaluation_param => Evaluation::BAD_EVALUATION).id).size if self.evaluation_logs
  end
  
end
