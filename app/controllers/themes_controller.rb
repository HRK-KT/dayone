class ThemesController < ApplicationController
before_action :set_current_user

  def new
    @theme = Theme.new
  end

  def create
    Theme.create(theme_params)
  end

  private
  def theme_params
    params.require(:theme).permit(:title, :answer1, :answer2, :genre).merge(created_user_id: current_user.id)
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
