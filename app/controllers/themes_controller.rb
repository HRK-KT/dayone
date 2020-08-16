class ThemesController < ApplicationController
before_action :set_current_user

  
  def index
    @themes = Theme.where(user_id: current_user.id)
    @counts = Theme.where(user_id: current_user.id).count
  end

  def new
    if user_signed_in?
      @theme = Theme.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    Theme.create(theme_params)
  end

  def search
    if user_signed_in?
      @themes = Theme.search(params[:keyword])
      @counts = Theme.search(params[:keyword]).count
    else
      redirect_to new_user_session_path
    end
  end

  private
  def theme_params
    params.require(:theme).permit(:title, :image, :answer1, :answer2, :genre).merge(user_id: current_user.id)
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
