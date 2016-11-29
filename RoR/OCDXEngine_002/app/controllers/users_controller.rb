class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @user_posts = @user.posts
  end
end
