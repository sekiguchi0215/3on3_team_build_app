class EntriesController < ApplicationController
  def create
    current_user.entries.create!(recruitment_id: params[:recruitment_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.entries.find_by(recruitment_id: params[:recruitment_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
end
