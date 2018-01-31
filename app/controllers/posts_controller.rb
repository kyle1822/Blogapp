class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index

    if params[:category].blank?
      @posts = Post.all.order("created_at DESC")
    else
      @catagory_id = Catagory.find_by(name: params[:catagory]).id
      @posts = Post.where(catagory_id: @catagory_id).order("created_at DEC")
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "The post was created!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Update successfull"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice "Post destroyed!"
  end

private

  def post_params           #sets parameters
    params.require(:post).permit(:title, :content, :category_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
