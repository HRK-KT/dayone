class AnswersController < ApplicationController
  before_action :set_current_user
  before_action :get_randam_theme ,only: :new

  def index
    @answers = Answer.where(user_id: current_user.id)
    theme_ids = @answers.distinct.pluck(:theme_id)
    @themes = Theme.find(theme_ids)
  end

  def new
    @answer = Answer.new
  end

  def create
    Answer.create(answer_params)
  end

  def show
    @answer = Answer.find(params[:id])
  end

  private
  def answer_params
    params.require(:answer).permit(:answer,:theme_id).merge(user_id: current_user.id)
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def get_randam_theme
    max = Theme.all.count
    num = rand(1..max)
    @theme = Theme.find(num)
    @theme_id = @theme.id
  end


end
