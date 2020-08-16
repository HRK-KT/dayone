class ThemesController < ApplicationController
before_action :set_current_user

  
  def index
    @themes = Theme.where(user_id: current_user.id)
    @counts = Theme.where(user_id: current_user.id).count
  end

  def new
    @theme = Theme.new
  end

  def create
    Theme.create(theme_params)
  end

  def search
    @themes = Theme.search(params[:keyword])
    @counts = Theme.search(params[:keyword]).count
  end

  private
  def theme_params
    params.require(:theme).permit(:title, :answer1, :answer2, :genre).merge(user_id: current_user.id)
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
