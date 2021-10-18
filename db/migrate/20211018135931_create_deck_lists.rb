class CreateDeckLists < ActiveRecord::Migration[6.1]
  def change
    create_table :deck_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :deck_list, null: false
      t.integer :status, null: false, default: 0
      t.text :content

      t.timestamps
    end
  end
end
