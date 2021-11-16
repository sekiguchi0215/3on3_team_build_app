class CreateTeamMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :team_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.text :message, null: false

      t.timestamps
    end
  end
end
