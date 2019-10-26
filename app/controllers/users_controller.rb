class UsersController < ApplicationController
  attr_accessor :points
  def show 
    @user = User.find(params[:id])
  end

  def current_user_id
    render json: {id: current_user.id}
  end

end
