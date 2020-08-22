class FriendRequestsController < ApplicationController
  before_action :get_request_user_id ,only: :new
  before_action :user_params, only: :create

  def new
    @request = FriendRequest.new
  end

  def create
    FriendRequest.create(user_params)
  end

  def destroy
    @request = FriendRequest.find(params[:id])
    @request.destroy
    redirect_to user_friends_path
  end

  private 
  def get_request_user_id
    @user =User.find(params[:user_id])
  end 
  
  def user_params
    params.permit(:to_user_id).merge(from_user_id: current_user.id)
  end

end
