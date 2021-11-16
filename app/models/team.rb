class Team < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :team_messages, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
