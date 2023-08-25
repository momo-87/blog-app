class CommentsController < ApplicationController
  def new
    comment = Comment.new
    respond_to do |format|
      format.html { render partial: 'shared/new_comment_form', locals: { comment: } }
    end
  end

  def create
    comment = Comment.new(comment_params)
    comment.post = Post.find(params[:post_id])
    comment.author = current_user

    respond_to do |format|
      format.html do
        if comment.save
          redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id]),
                      notice: 'Comment was successfully created.'
        else
          render :new
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
