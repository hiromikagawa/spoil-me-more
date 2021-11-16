class BestsController < ApplicationController
  def create
    current_user.best_this(clicked_tweet)
    flash[:success] = '投稿に「いいね！」しました。'
    redirect_back(fallback_location: root_path)#この部分で、前のページに戻る
  end

  def destroy
    current_user.bests.find_by(tweet_id: params[:tweet_id]).destroy
    flash[:danger] = '「いいね！」を解除しました'
    redirect_back(fallback_location: root_path)
  end

  private

  def clicked_tweet
    Tweet.find(params[:tweet_id])
  end
end
