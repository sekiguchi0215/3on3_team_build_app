class AddNameToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :name, :string
  end
end
