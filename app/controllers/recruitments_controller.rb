class RecruitmentsController < ApplicationController
  def new
    @recruitment = Recruitment.new
  end

  def create
    recruitment = current_user.recruitments.create!(recruitment_params)
    redirect_to recruitment
  end

  def index
    @recruitments = Recruitment.order(:updated_at)
  end

  def show
    @recruitment = Recruitment.find(params[:id])
  end

  def edit
    @recruitment = Recruitment.find(params[:id])
  end

  def update
    recruitment = Recruitment.update(recruitment_params)
    redirect_to recruitment
  end

  def destroy
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:event_title, :number_of_applicants, :recruitment_condition, :introduction)
  end
end
