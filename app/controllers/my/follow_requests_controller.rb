class My::FollowRequestsController < My::BaseController

  before_action :prepare_follow_requests, only: [:new]
  before_action :prepare_follow_request, only: [:accept, :reject, :resend, :destroy]

  def new
  end

  def create
    @follow_request = current_user.follow_requests.build(recipient: recipient)
    if @follow_request.save
      redirect_to new_my_follow_request_path, flash: { success: "Follow Request Sent to #{recipient.name}" }
    else
      redirect_to new_my_follow_request_path, flash: { error: @follow_request.errors.full_messages.to_sentence }
    end
  end

  def accept
    @follow_request.accepted!
    redirect_to new_my_follow_request_path, flash: { success: "#{sender.name} now follows you!" }
  end

  def resend
    @follow_request.pending!
    redirect_to new_my_follow_request_path, flash: { success: "Friend Request Resent to #{recipient.name}" }
  end

  def reject
    @follow_request.rejected!
    redirect_to new_my_follow_request_path, flash: { success: "You rejected #{sender.name}'s follow request!" }
  end

  def destroy
    @follow_request.destroy
    redirect_to new_my_follow_request_path, flash: { success: "You disallowed #{sender.name} from following you anymore!" }
  end

  private

  def follow_request_post_params
    params.permit(:recipient)
  end

  def prepare_follow_request
    @follow_request = FollowRequest.find(params[:id])
  end

  def recipient
    User.find(params[:recipient_id])
  end

  def sender
    User.find_by(id: params[:sender_id])
  end

  def prepare_follow_requests
    @unaccepted_sent_requests = FollowRequest.where(sender_id: current_user.id, status: %w(pending rejected))
    @accepted_sent_requests = FollowRequest.where(sender_id: current_user.id, status: ['accepted'])
    @recieved_follow_requests = FollowRequest.where(recipient_id: current_user.id, status: ['pending'])
    @accepted_follow_requests = FollowRequest.where(recipient_id: current_user.id, status: ['accepted'])
    @sent_to = []
    @unaccepted_sent_requests.each do |request|
      @sent_to.push(request.recipient_id)
    end
  end

end
