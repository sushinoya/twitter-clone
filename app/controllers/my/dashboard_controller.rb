class My::DashboardController < My::BaseController

  def index
    @user = current_user
    @my_tweets = current_user.tweets.to_a
    @form = TweetForm.new(current_user)
  end

end
