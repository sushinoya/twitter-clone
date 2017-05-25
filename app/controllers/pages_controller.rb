class PagesController < ApplicationController

  def home
    @user = current_user
    @tweets = Tweet.all
  end

  # def myhome
  #   @user = current_user
  #   @tweets = Tweet.all
  # end

end
