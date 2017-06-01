class My::DashboardController < My::BaseController

  def index
    @user = current_user
    @my_tweets = current_user.tweets.to_a
    @tweet_create_form = TweetForm.new(current_user)
    @status_update_form = StatusUpdateForm.new(current_user)
  end

end
