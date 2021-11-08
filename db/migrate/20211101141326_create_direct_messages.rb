class CreateDirectMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :direct_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.text :message, nill: false

      t.timestamps
    end
    add_index :direct_messages, [:user_id, :room_id], unique: true
  end
end
