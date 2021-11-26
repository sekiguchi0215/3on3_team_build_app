class Room < ApplicationRecord
  has_many :room_keys, dependent: :destroy
  has_many :direct_messages, dependent: :destroy

  def show_last_direct_message
    if (last_message = direct_messages.last).present?
      last_message.message
    else
      "まだメッセージはありません。"
    end
  end
end
