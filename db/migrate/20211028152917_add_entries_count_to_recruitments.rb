class AddEntriesCountToRecruitments < ActiveRecord::Migration[6.1]
  def change
    add_column :recruitments, :entries_count, :integer, default: 0
  end
end
