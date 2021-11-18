class TeamMessage < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :message, presence: true

  def team_message_notification(current_user, visited_ids, team_id)
    visited_ids.each do |visited_id|
      save_team_message_notification(current_user, visited_id[:user_id], team_id)
    end
  end

  def save_team_message_notification(current_user, visited_id, team_id)
    temp = Notification.where(visitor_id: current_user.id, visited_id: visited_id, team_id: team_id)
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: visited_id,
        team_id: team_id,
        action: "team_message",
      )
      notification.save if notification.valid?
    else
      temp.update(checked: false)
    end
  end
end
