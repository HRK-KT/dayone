class GroupsController < ApplicationController
  before_action :search_friends, only: [:new, :edit]
  def index
  end

  def new
    if request.referer&.include?("/user_friends")
      @user = User.find(params[:user_id])
      if Group.find_by(id: @user.id).nil?
        @group = Group.new
        @group.users << current_user
      else
        redirect_to groups_path
      end
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      # render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(params[:id]), notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def search_friends
    user_friends = UserFriend.where(user_id: current_user.id)
    @users = []
    @users << current_user
    user_friends.each do |friend|
      @users << User.find(friend.friend_user_id)
    end
  end

end
