class AnswersController < ApplicationController
  before_action :set_current_user
  before_action :get_randam_theme

  def index
  end

  def new
    @answer = Answer.new
  end

  def create
    Answer.create(answer_params.merge(theme_id: @theme_id))
  end

  private
  def answer_params
    params.require(:answer).permit(:answer).merge(user_id: current_user.id)
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def get_randam_theme
    @theme = Theme.find(2)
    @theme_id = @theme.id
  end



end
