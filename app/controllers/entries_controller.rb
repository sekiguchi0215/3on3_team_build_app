class EntriesController < ApplicationController
  def create
    current_user.entries.create!(recruitment_id: params[:recruitment_id])
    @recruitment = Recruitment.find(params[:recruitment_id])
    @recruitment.create_notification_entry!(current_user)
  end

  def destroy
    current_user.entries.find_by(recruitment_id: params[:recruitment_id]).destroy!
    @recruitment = Recruitment.find(params[:recruitment_id])
  end
end
