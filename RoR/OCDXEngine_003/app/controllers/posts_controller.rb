class PostsController < ApplicationController
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])

    #respond_to do |format|
      #if @post.update_attributes(post_params)
        #flash[:notice] = 'Post was successfully updated.'
        #redirect_to post_path(@post)
      #else
        #format.html { render :action => "edit" }
      #end
      @post.update_attributes(post_params)
      redirect_to post_path(@post)
    #end
  end
  def new
    #@post = posts_url.build(post_params)
    @post = Post.new
    @post.user_id = current_user.id
    #@post.user_id = current_user.id
    #redirect_to posts_path(@post)
  end

  def index
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
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
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to new_post_path
  end

private
  def post_params
 params.require(:post).permit( :json, :description, :title, :data, :user_id, :file, :filetwo, :filethree, :filefour, :filefive , :tags)
  end
end
