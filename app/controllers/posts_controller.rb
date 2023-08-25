class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts
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
    @current_user = current_user
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
