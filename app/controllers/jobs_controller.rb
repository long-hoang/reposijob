class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

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

  def edit
  end

  def update
    @job = Job.find(params[:id])

   if @job.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    
    @job.claim.user.points = @job.claim.user.points + @job.reward
    @job.done = true
    @job.save
    @job.claim.user.save
    redirect_to job_path(@job)
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :prompt, :reward)
  end
end
