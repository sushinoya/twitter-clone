class PagesController < ApplicationController

  def home
    @user = current_user
    @tweets = Tweet.all
    @my_tweets = current_user.tweets.to_a
    @tweet_form = TweetsForm.new(current_user)
  end

end
