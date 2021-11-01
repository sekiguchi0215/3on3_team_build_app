class RoomKey < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
