class TeamsController < ApplicationController
  def new
    @team = Team.new
    @team.members << current_user
  end

  def create
    @team = Team.new(group_params)
    if @team.save
      redirect_to team_path(@team), notice: "チームを作成しました。"
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
    @members = @team.members.order(:created_at)
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
