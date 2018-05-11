class MainsController < ApplicationController
  def index
    @activity_logs = ActivityLog.all.order("created_at desc")
  end
  
  def event
    
  end
  
  def otaku
    
  end
  
  def attend
    
  end
end
