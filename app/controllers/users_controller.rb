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

  private 

  def user_params
    params.require(:user).permit(:name, :email, :sex, :age, :region, :job)
  end
end
