class AddIsValidToDirectMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :direct_messages, :is_valid, :boolean, default: true, null: false
  end
end
