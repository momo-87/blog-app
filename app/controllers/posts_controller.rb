class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find_by(id: params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = @user.posts.find(params[:id])
    @currrent = current_user
    @like = Like.new
  end

  def create
    post = current_user.posts.new(post_params)

    respond_to do |format|
      format.html do
        if post.save
          redirect_to user_posts_url(user_id: current_user.id), notice: 'Post was successfully created.'
        else
          render :new
        end
      end
    end
  end

  def destroy
    puts 'hello'
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.author_id), notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
