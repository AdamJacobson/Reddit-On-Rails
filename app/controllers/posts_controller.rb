class PostsController < ApplicationController

  before_action :require_logged_in, only: [:new, :create]
  before_action :require_author, only: [:edit, :update]

  def new
    @post = Post.new
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = this_post
  end

  def update
    @post = this_post
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = this_post
    @all_comments = @post.comments_by_parent_id
  end

  def destroy
    post = this_post
    post.destroy
    redirect_to sub_url(post.sub)
  end

  private

  def this_post
    Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def require_author
    author = Post.find(params[:id]).author
    redirect_to posts_url unless current_user = author
  end
end
