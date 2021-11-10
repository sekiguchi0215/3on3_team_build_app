class Team < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :users, through: :members

  validates :name, presence: true, uniqueness: true
end
