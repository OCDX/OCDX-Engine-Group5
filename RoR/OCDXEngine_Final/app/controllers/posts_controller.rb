class PostsController < ApplicationController
require 'json'
#require 'httparty'
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to post_path(@post)
  end
  def new
    @post = Post.new
    @post.user_id = current_user.id
  end

  def index
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
    #@creater = Post.user.first_name
  end
  def show
    @post = Post.find_by_id(params[:id])
  end

  def create
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


def get_json
string = '{"post":{"title":"titles parsed"}}'
parsed = JSON.parse(string)

p parsed["post"]["title"]
render p
ap JSON.parse HTTParty.get('http://ec2-35-160-28-84.us-west-2.compute.amazonaws.com:3000/uploads/post/json/1/manifest.json').response.body
end
  def post_params
 params.require(:post).permit( :get_json, :json, :description, :title, :data, :user_id, :file, :filetwo, :filethree, :filefour, :filefive , :tags, :coauthorone, :coauthortwo, :coauthorthree, :coauthorfour, :coauthorfive, :manifestVersion, :resObjTitle, :resObjAbstract, :resObjDate, :resObjDateLabel, :privacyOSight, :privacyIConsent, :privacyAnonData, :privacyConsiderations, :provenanceNarrative, :publication, :locationURL, :locationComment, :filePermissions, :creators)
  end
end
