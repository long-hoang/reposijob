class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @job = Job.find(params[:job_id])
    @job.messages.create(message_params.merge(user: current_user))
    


    if current_user.id == @job.user_id
      recipient = @job.claim.user_id
    else 
      recipient = @job.user_id
    end

    temp_text = "New Message on Job: " + @job.title

    current_user.notifications.create(content: temp_text, recipient_id: recipient)


    redirect_to job_path(@job)
  end

  def message_params
    params.require(:message).permit(:content)
  end

end
