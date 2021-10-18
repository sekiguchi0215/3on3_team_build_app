class DeckList < ApplicationRecord
  belongs_to :user

  validates :deck_list, presence: true

  enum status: {
    public: 0,
    private: 1,
  }
end
