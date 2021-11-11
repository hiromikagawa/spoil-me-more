class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def following
      @user = User.find(params[:id])
      @user = @user.following_relationships
      render 'show_follow'
  end

  def followers
     @user = User.find(pramus[:id])
     @users = @user.followers
     render 'show_follower'
  end
end
