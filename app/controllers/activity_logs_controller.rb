class ActivityLogsController < ApplicationController
  def index
    @activity_logs = ActivityLog.all.order("created_at desc")
  end
end
