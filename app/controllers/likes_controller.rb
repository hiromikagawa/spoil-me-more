class LikesController < ApplicationController

  def create
    current_user.like_this(clicked_comment)
    flash[:success] = '投稿に「素敵ね！」しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.likes.find_by(comment_id: params[:comment_id]).destroy
     flash[:danger] = '「素敵ね！」を解除しました。'
    redirect_back(fallback_location: root_path)
  end

  private
  def clicked_comment
    Comment.find(params[:comment_id])
  end
end