class EntriesController < ApplicationController
  def create
    @recruitment = Recruitment.find(params[:recruitment_id])
    current_user.entries.create!(recruitment_id: @recruitment.id)
  end

  def destroy
    @recruitment = Recruitment.find(params[:recruitment_id])
    current_user.entries.find_by(recruitment_id: @recruitment.id).destroy!
  end
end
