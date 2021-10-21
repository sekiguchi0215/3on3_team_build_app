class DeckList < ApplicationRecord
  belongs_to :user

  validates :status, presence: true
  validates :deck_list, presence: true

  enum status: [:public, :private], _prefix: true

  mount_uploader :deck_list, DeckImageUploader
end
