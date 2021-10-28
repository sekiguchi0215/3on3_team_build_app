class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :recruitment, counter_cache: :entries_count

  validates :user_id, uniqueness: {
                        scope: :recruitment_id,
                        message: "既に応募しています。",
                      }
  validate :my_recruitment_cannot_entry

  private

  def my_recruitment_cannot_entry
    errors.add(:base, "自分の募集に応募はできません。") if user_id == recruitment.user_id
  end
end
