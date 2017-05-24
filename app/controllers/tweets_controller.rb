class TweetsController < ApplicationController

  before_action :prepare_tweet, only: [:destroy]

  def create
    @tweet = Tweet.new(tweet_post_params.merge(user: current_user))
    if @tweet.save
      redirect_to root_path, flash: { success: 'Successfully posted tweet' }
    else
      redirect_to root_path, flash: { error: @tweet.errors.full_messages.to_sentence }
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to root_path, flash: { success: 'Successfully deleted tweet' }
    else
      redirect_to root_path, flash: { error: @tweet.errors.full_messages.to_sentence }
    end
  end

  private

  def tweet_post_params
    params.require(:tweet).permit(:text)
  end

  def prepare_tweet
    @tweet = Tweet.find_by(id: params[:id])
  end

end
