class PagesController < ApplicationController

  def home
    @user = current_user
    @tweets = Tweet.all
  end

end
