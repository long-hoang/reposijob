class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create 
    current_user.jobs.create(job_params)
    redirect_to root_path
  end

  def show 
    @job = Job.find(params[:id])
  end


  private

  def job_params
    params.require(:job).permit(:title, :prompt, :reward)
  end
end
