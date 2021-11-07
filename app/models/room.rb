class Room < ApplicationRecord
  has_many :room_keys, dependent: :destroy
  has_many :direct_messages, dependent: :destroy
end
