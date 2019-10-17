class UsersController < ApplicationController
  attr_accessor :points
  def show 
    @user = User.find(params[:id])
  end

end
