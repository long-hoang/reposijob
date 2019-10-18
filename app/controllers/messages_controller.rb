class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @job = Job.find(params[:job_id])
    @job.messages.create(message_params.merge(user: current_user))
    redirect_to job_path(@job)
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
