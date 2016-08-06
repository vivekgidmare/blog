class PostsController < ApplicationController
  before_action :find_post, only: [:show,:edit,:update,:destroy]
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post =Post.new(post_params)
    if @post.save
      redirect_to @post , notice: "Hey Vivek! Your Article was successfully saved!"
    else
      render 'new', notice: "Oh no,Vivek! I was unable to save your post"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Hey! Your article successfuly saved!"
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :slug)
  end
end
