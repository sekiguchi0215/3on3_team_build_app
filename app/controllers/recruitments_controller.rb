class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: %i[edit update destroy]

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = current_user.recruitments.new(recruitment_params)
    if @recruitment.save
      redirect_to recruitments_path, notice: "メンバー募集を投稿しました。"
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @recruitments = Recruitment.order(:updated_at)
  end

  def show
    @recruitment = Recruitment.find(params[:id])
  end

  def edit
  end

  def update
    if @recruitment.update(recruitment_params)
      redirect_to @recruitment, notice: "更新しました。"
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @recruitment.destroy
    redirect_to recruitments_path, alert: "募集を削除しました。"
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:event_title, :number_of_applicants, :recruitment_condition, :introduction)
  end

  def set_recruitment
    @recruitment = current_user.recruitments.find_by(id: params[:id])
    redirect_to root_path, alert: "権限がありません。" if @recruitment.nil?
  end
end
