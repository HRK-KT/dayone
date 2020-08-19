class CommentsController < ApplicationController

  def new
    @answer = Answer.find_by(id: params[:answer_id])
    @theme = Theme.find_by(id: @answer.theme_id)
    @comment = Comment.new
  end

  def create
    answer = Answer.find_by(id: params[:answer_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path
    end
  end

  def edit

  end

  def update

  end
  
  def destroy

  end

  private 
  
  def comment_params
    params.require(:comment).permit(:comment, :theme_id).merge(user_id: current_user.id, answer_id: params[:answer_id])
  end


end
