class DeckList < ApplicationRecord
  belongs_to :user

  validates :deck_list, presence: true
end
