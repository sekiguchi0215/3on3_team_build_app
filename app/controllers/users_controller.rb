class UsersController < ApplicationController
  PER_PAGE = 20

  def index
    @users = User.page(params[:page]).per(PER_PAGE).order(:updated_at)
  end

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @decks = @user.deck_lists.includes(:user).order(:updated_at)
    else
      @decks = @user.deck_lists.includes(:user).where(status: "public")
    end
    @entries = @user.entried_recruitment

    # ダイレクトメッセージ機能の処理
    @currentUserRoomKey = RoomKey.where(user_id: current_user.id)
    @userRoomKey = RoomKey.where(user_id: @user.id)

    unless @user.id == current_user.id
      @currentUserRoomKey.each do |current_user|
        @userRoomKey.each do |user|
          if current_user.room_id == user.room_id
            @haveRoom = true
            @roomId = current_user.room_id
          end
        end
      end
      unless @haveRoom
        @room = Room.new
        @room_key = RoomKey.new
      end
    end
  end
end
