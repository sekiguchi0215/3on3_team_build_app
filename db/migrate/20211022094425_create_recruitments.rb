class CreateRecruitments < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitments do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :number_of_applicants
      t.string :event_title
      t.integer :recruitment_condition
      t.text :introduction

      t.timestamps
    end
  end
end
