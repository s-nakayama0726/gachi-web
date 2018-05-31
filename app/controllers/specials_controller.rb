class SpecialsController < ApplicationController
  def special1
    @users = Questionnaire.all.collect do | questionnaire |
      questionnaire.user
    end
  end
  
  def save_special1_questionnaire
    user = User.find_by_id(session[:user_id])
    
    if user.questionnaires.exists?
      redirect_to :action => "special1" and return
    else
      questionnaire = user.questionnaires.build
      questionnaire.point = params[:point]
      questionnaire.comment = params[:comment]
      questionnaire.save
      user.activity_logs.build.save_activity_log("第一回「THE・オタク哲学」のアンケート に回答しました")
    end
    
    redirect_to :action => "special1" and return
  end
end
