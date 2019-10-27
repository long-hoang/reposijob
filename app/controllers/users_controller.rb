class UsersController < ApplicationController
  attr_accessor :points

  

  def show 
    @user = User.find(params[:id])
 
  end

  def current_user_id
    if user_signed_in? 
      render json: {id: current_user.id}
    end
  end

end
