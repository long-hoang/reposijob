class NotificationsController < ApplicationController

  def index
    render json: Notification.all
  end

end
