class PostsController < ApplicationController
  def new
    #@post = posts_url.build(post_params)
    @post = Post.new
    @post.user_id = current_user.id
    #@post.user_id = current_user.id
    #redirect_to posts_path(@post)
  end

  def index
    @posts = Post.all
  end

  def show
    #@posts - Post.all
    @post = Post.find_by_id(params[:id])
  end

  def create
    #@post.user_id = current_user.id
    #@post = posts_url.create(post_params)
    #@post.user_id = current_user.id
    #@post = current_user.posts.build(permit_post)
    @post = Post.new(post_params)
    if @post.save
	flash[:success] = "Success!"
	redirect_to post_path(@post)
    else
	flash[:error] = @post.errors.full_messages
	redirect_to new_post_path
    end 
  end

    private
    def post_params
	params.require(:post).permit( :json, :description, :title, :jsonTxt )
    end
end
