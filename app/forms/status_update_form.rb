class StatusUpdateForm

  include ActiveModel::Model

  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def update(user_attributes)
    @user.update(user_attributes)
  end

end
