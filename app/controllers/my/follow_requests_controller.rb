class My::FollowRequestsController < My::BaseController

  before_action :prepare_follow_request,   only: [:accept, :reject, :resend, :destroy]
  before_action :prepare_follow_requests,  only: [:new]
  before_action :check_user_not_recipient, only: [:accept, :reject, :destroy]
  before_action :check_user_not_sender,    only: [:resend]

  def new
  end

  def create
    @recipient = User.find(params[:recipient_id])
    @follow_request = current_user.follow_requests.build(recipient: @recipient)
    if @follow_request.save
      redirect_to new_my_follow_request_path, flash: { success: "Follow Request Sent to #{@follow_request.recipient.name}" }
    else
      redirect_to new_my_follow_request_path, flash: { error: @follow_request.errors.full_messages.to_sentence }
    end
  end

  def accept
    @follow_request.accepted!
    redirect_to new_my_follow_request_path, flash: { success: "#{@follow_request.sender.name} now follows you!" }
  end

  def resend
    @follow_request.pending!
    redirect_to new_my_follow_request_path, flash: { success: "Friend Request Resent to #{@follow_request.recipient.name}" }
  end

  def reject
    @follow_request.rejected!
    redirect_to new_my_follow_request_path, flash: { success: "You rejected #{@follow_request.sender.name}'s follow request!" }
  end

  def destroy
    @follow_request.destroy
    redirect_to new_my_follow_request_path, flash: { success: "You disallowed #{@follow_request.sender.name} from following you anymore!" }
  end

  private

  def check_user_not_recipient
    redirect_to new_my_follow_request_path, flash: { error: 'This follow request is not for you.' } unless @follow_request.recipient_id == current_user.id
  end

  def check_user_not_sender
    redirect_to new_my_follow_request_path, flash: { error: 'You did not send this follow request' } unless @follow_request.sender_id == current_user.id
  end

  def follow_request_post_params
    params.permit(:recipient)
  end

  def prepare_follow_request
    @follow_request = FollowRequest.find(params[:id])
  end

  def prepare_follow_requests
    @unaccepted_sent_requests = FollowRequest.sent_unaccepted.where(sender_id: current_user.id)
    @accepted_sent_requests   = FollowRequest.accepted.where(sender_id: current_user.id)
    @recieved_follow_requests = FollowRequest.pending.where(recipient_id: current_user.id)
    @accepted_follow_requests = FollowRequest.accepted.where(recipient_id: current_user.id)
    @sent_to = []
    @unaccepted_sent_requests.each do |request|
      @sent_to.push(request.recipient_id)
    end
  end

end
