class NotificationsController < ApplicationController



  def index
    render json: Notification.all
  end

  def update
    notification = Notification.find(params[:id])

    notification.update_attributes(noti_params)
    render json: notification
  end

  def show
    render json: Notification.find(params[:id])
  end


  private 

  def noti_params
    params.require(:notification).permit(:read)
  end


end
