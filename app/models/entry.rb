class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :recruitment, counter_cache: :entries_count

  validates :user_id, uniqueness: {
                        scope: :recruitment_id,
                        message: "既に応募しています。",
                      }
end
