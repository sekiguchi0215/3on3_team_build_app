class DeleteUniqueToDirectMessage < ActiveRecord::Migration[6.1]
  def change
    remove_index :direct_messages, [:user_id, :room_id], unique: true
    add_index :direct_messages, [:user_id, :room_id]
  end
end
