class DirectMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy

  validates :message, presence: true

  def create_notificaton_direct_message!(current_user, visited_id, room_id)
    temp = Notification.where(visitor_id: current_user.id, visited_id: visited_id, room_id: room.id, action: "direct_message")
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: visited_id,
        room_id: room_id,
        action: "direct_message",
      )

      notification.save if notification.valid?
    else
      temp.update(checked: false)
    end
  end
end
