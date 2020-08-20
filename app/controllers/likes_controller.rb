class LikesController < ApplicationController
  before_action :set_comment

  def create
    @like = Like.create(user_id: current_user.id, comment_id: @comment.id )
    # respond_to do |format|
    #   format.js {render :create}
    # end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, comment_id: @comment.id )
    @like.destroy
    # respond_to do |format|
    #   format.js {render :destroy}
    # end
  end

  private
  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
