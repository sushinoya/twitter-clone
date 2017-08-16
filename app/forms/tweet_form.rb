class TweetForm

  include ActiveModel::Model

  attr_accessor :user, :tweet

  def initialize(user, params = {})
    @user = user
    @tweet = user.tweets.new(params)
  end

  def save
    @tweet.save
  end

end
