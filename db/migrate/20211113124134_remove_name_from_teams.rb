class RemoveNameFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :name, :string
  end
end
