class ClaimsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.claims.create(job: current_job)
    current_job.claimed = true
    current_job.save

    recipient = current_job.user_id

    temp_text = 'Your job "' + current_job.title + '" has been claimed!'

    current_user.notifications.create(content: temp_text, recipient_id: recipient, job_id: current_job.id)


    redirect_to job_path( current_job)
  end

  private 

  def current_job
    @current_job ||= Job.find(params[:job_id])
  end
end
