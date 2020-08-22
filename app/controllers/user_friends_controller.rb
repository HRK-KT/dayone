class UserFriendsController < ApplicationController
  before_action :set_request_user, only: :new

  def index
    @user_friends = UserFriend.where(user_id: current_user.id)
    @request_users = FriendRequest.where(to_user_id: current_user.id)
  end

  def new
    @user_friend = UserFriend.new
  end

  def create
    @friend = UserFriend.new(user_params)
    # リクエストのレコードを消すために一応取得
    @request = FriendRequest.find_by(to_user_id: @friend.user_id, from_user_id: @friend.friend_user_id)
    if @friend.save
      # 逆パターン作成用
      @others = UserFriend.new
      @others.user_id = @friend.friend_user_id
      @others.friend_user_id = @friend.user_id
      if @others.save
        # リクエストレコード削除
        @request.destroy
      end
    end
  end

  private 
  def set_request_user
    @request_user = User.find(params[:id])
  end

  def user_params
    params.permit(:friend_user_id ).merge(user_id: current_user.id)
  end


end
