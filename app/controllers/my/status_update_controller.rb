class My::StatusUpdateController < My::BaseController

  def update
    @form = StatusUpdateForm.new(current_user)
    if @form.update(account_update_params[:user])
      redirect_to my_root_path, flash: { success: 'Successfully updated status' }
    else
      redirect_to my_root_path, flash: { error: current_user.errors.full_messages.to_sentence }
    end
  end

  private

  def account_update_params
    params.require(:status_update_form).permit(user: [:status])
  end

end
