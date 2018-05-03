class AdminController < ApplicationController
  def index
    @events = Event.all
  end
  
  def create
    event = Event.new
    event.name = "test_event"
    event.save
    
    redirect_to :action => "index"
  end
end
