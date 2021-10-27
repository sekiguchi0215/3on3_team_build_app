class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :recruitment

  validates :user_id, uniqueness: {
              scope: :recruitment_id,
              message: "既に応募しています。",
            }
end
