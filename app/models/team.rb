class Team < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :team_messages, dependent: :destroy
  has_many :notifications, dependent: :destroy

  def save_team_invitation_notification(current_user, visited_id, team_id)
    temp = Notification.where(visitor_id: current_user.id, visited_id: visited_id, team_id: team_id)
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: visited_id,
        team_id: team_id,
        action: "invitation",
      )
      notification.save if notification.valid?
    end
  end

  def team_invitation_notification(current_user, user_ids, team_id)
    visited_ids = user_ids.reject(&:empty?)
    visited_ids.each do |visited_id|
      save_team_invitation_notification(current_user, visited_id, team_id)
    end
  end

  def show_last_team_message
    if (last_message = team_messages.last).present?
      last_message.message
    else
      "まだメッセージはありません。"
    end
  end
end
