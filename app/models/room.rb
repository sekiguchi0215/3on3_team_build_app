class Room < ApplicationRecord
  has_many :room_key, dependnet: :destroy
  has_many :direct_messages, dependent: :destroy
end
