class DirectMessagesController < ApplicationController
  def create
    if RoomKey.where(user_id: current_user.id, room_id: params[:direct_message][:room_id]).present?
      @direct_message = DirectMessage.create(direct_message_params)
      room_key = @direct_message.room.room_keys.where.not(user_id: current_user.id)
      @direct_message.create_notificaton_direct_message!(current_user, room_key.first.user_id)
      redirect_to room_path(@direct_message.room_id)
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
    end
  end

  def update
    @direct_message = DirectMessage.find(params[:id])
    @direct_message.update(is_valid: false)
    redirect_to request.referer
  end

  private

  def direct_message_params
    params.require(:direct_message).permit(:user_id, :room_id, :message).merge(user_id: current_user.id)
  end
end
