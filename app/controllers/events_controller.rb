require "uri"

class EventsController < ApplicationController
  def show
    @event = Event.find_by_id(params[:id]);
    @id = params[:id]
  end
  
  def attend
    unless session[:user_id]
      redirect_to "/auth/twitter?from=" + request.referer and return
    else 
      user = User.find_by_id(session[:user_id])
      event = Event.find_by_id(params[:id])
      unless event.is_attended?(user.id)
        attend = user.attends.build
        attend.event_id = params[:id]
        attend.save
      end
      user.activity_logs.build.save_activity_log(event.name + " に参加表明しましたｗ")
      redirect_to :action => "show", :id => params[:id] 
    end
  end
end
