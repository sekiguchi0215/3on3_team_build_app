class AddRoomIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :room_id, :integer
    add_index :notifications, :room_id
    remove_column :notifications, :direct_message_id, :integer
  end
end
