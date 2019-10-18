class ClaimsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.claims.create(job: current_job)
    current_job.claimed = true
    current_job.save
    redirect_to job_path( current_job)
  end

  private 

  def current_job
    @current_job ||= Job.find(params[:job_id])
  end
end
