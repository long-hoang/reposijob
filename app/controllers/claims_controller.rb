class ClaimsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.claims.create(job: current_job)
    current_job.claimed = true
    current_job.save
    redirect_to jobs_path
  end

  private 

  def current_job
    @current_job ||= Job.find(params[:job_id])
  end
end
