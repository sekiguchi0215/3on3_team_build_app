class TeamMessagesController < ApplicationController
  def create
    if Member.where(user_id: current_user.id, team_id: params[:team_message][:team_id]).present?
      @team_message = TeamMessage.create(team_message_params)
      visited_ids = @team_message.team.members.where.not(user_id: current_user.id)
      @team_message.team_message_notification(current_user, visited_ids, @team_message.team_id)
      redirect_to request.referer
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
    end
  end

  def update
    @message = TeamMessage.find(params[:id])
    @message.update(is_valid: false)
    redirect_to request.referer
  end

  private

  def team_message_params
    params.require(:team_message).permit(:user_id, :team_id, :message).merge(user_id: current_user.id)
  end
end
