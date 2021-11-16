class AddIsValidToTeamMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :team_messages, :is_valid, :boolean, null: false, default: true
  end
end
