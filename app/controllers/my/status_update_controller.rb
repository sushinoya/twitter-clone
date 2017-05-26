class My::StatusUpdateController < My::BaseController

  def update
    if current_user.update(account_update_params)
      redirect_to my_root_path, flash: { success: 'Successfully updated status' }
    else
      redirect_to my_root_path, flash: { error: current_user.errors.full_messages.to_sentence }
    end
  end

  private

  def account_update_params
    params.require(:user).permit(:status)
  end

end
