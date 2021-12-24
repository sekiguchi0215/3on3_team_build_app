class Recruitment < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy
  has_many :entry_users, through: :entries, source: :user
  has_many :notifications, dependent: :destroy

  validates :event_title, presence: true
  validates :number_of_applicants, presence: true
  validates :recruitment_condition, presence: true

  enum number_of_applicants: { one: 1, two: 2 }
  enum recruitment_condition: { anyone: 1, enjoy: 2, seriousness: 3 }

  def entried_by?(user)
    entries.any? { |entry| entry.user_id == user.id }
  end

  def create_notification_entry!(current_user)
    temp = Notification.where(visitor_id: current_user.id, visited_id: user_id, recruitment_id: id, action: "entry")
    if temp.blank?
      notification = current_user.active_notifications.new(
        recruitment_id: id,
        visited_id: user_id,
        action: "entry",
      )

      notification.save if notification.valid?
    end
  end
end
