class TeamsController < ApplicationController
  def new
    @team = Team.new
    @team.users << current_user
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to team_path(@team), notice: "チームを作成しました。"
    else
      render :new
    end
  end

  def index
    @teams = current_user.teams.order(:created_at)
  end

  def show
    @team = Team.find(params[:id])
    if Member.where(user_id: current_user.id, team_id: @team.id).present?
      @members = @team.users.order(:created_at)
      @team_message = TeamMessage.new
      @messages = @team.team_messages.where.not(is_valid: false)
    else
      redirect_to root_path, alert: "このチームに所属していません。"
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to team_path(@team), notice: "グループを編集しました。"
    else
      render :edit
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, user_ids: [])
  end
end
