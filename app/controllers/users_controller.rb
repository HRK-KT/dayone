class UsersController < ApplicationController

  def new 
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show 
    @user = User.find(params[:id])
    @answers = Answer.where(user_id: current_user.id)
    theme_ids = @answers.pluck(:theme_id)
    @themes = Theme.find(theme_ids)
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :sex, :age, :region, :job, :image )
  end

end
