class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @user_posts = @user.posts
  end
def index
    @users = User.search(params[:search])
  end
end
