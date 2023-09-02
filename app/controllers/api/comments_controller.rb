class Api::CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    post = Post.find(params[:post_id])
    comments = post.comments
    render json: comments
  end
end