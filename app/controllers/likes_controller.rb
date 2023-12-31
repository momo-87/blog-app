class LikesController < ApplicationController
  def create
    like = Like.new
    like.post = Post.find(params[:post_id])
    like.author = User.find(params[:user_id])

    if like.save
      flash[:success] = 'Like saved successfully'
    else
      flash.now[:error] = 'Error: Like could not be saved'
    end
    redirect_to "/users/#{current_user.id}/posts/#{like.post.id}"
  end
end
