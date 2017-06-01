class TweetsController < ApplicationController

  before_action :prepare_tweet, only: [:destroy]

  def create
    @form = TweetsForm.new(current_user, tweet_post_params[:tweet])
    if @form.save
      redirect_to root_path, flash: { success: 'Successfully posted tweet' }
    else
      redirect_to root_path, flash: { error: @form.tweet.errors.full_messages.to_sentence }
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
    params.require(:tweets_form).permit(tweet: [:text])
  end

  def prepare_tweet
    @tweet = Tweet.find_by(id: params[:id])
  end

end
