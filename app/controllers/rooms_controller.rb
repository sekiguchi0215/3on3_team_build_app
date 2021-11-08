class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    if RoomKey.where(user_id: current_user.id, room_id: @room.id).present?
      anotherUserRoomKey = @room.room_keys.where.not(user_id: current_user.id)
      @anotherUser = User.find(anotherUserRoomKey.first[:user_id])
      @direct_messages = @room.direct_messages
      @direct_message = DirectMessage.create
      @keys = @room.room_keys
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @room = Room.create
    @currentUserRoomKey = RoomKey.create(user_id: current_user.id, room_id: @room.id)
    @userRoomKey = RoomKey.create(room_key_params)
    redirect_to room_path(@room.id), notice: "ルームを作成しました。"
  end

  private

  def room_key_params
    params.require(:room_key).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
