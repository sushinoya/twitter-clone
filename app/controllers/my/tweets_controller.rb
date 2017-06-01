class My::TweetsController < My::BaseController

  before_action :prepare_tweet, only: [:destroy]

  def create
    @form = TweetForm.new(current_user, tweet_post_params[:tweet])
    if @form.save
      redirect_to my_root_path, flash: { success: 'Successfully posted tweet' }
    else
      redirect_to my_root_path, flash: { error: @tweet.errors.full_messages.to_sentence }
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to my_root_path, flash: { success: 'Successfully deleted tweet' }
    else
      redirect_to my_root_path, flash: { error: @tweet.errors.full_messages.to_sentence }
    end
  end

  private

  def tweet_post_params
    byebug
    params.require(:tweet_form).permit(tweet:[:text])
  end

  def prepare_tweet
    @tweet = Tweet.find_by(id: params[:id])
  end

end
