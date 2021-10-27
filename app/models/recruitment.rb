class Recruitment < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy
  has_many :entry_users, through: :entries, source: :user

  validates :event_title, presence: true
  validates :number_of_applicants, presence: true
  validates :recruitment_condition, presence: true

  enum number_of_applicants: [:one, :two], _prefix: true
  enum recruitment_condition: [:anyone, :enjoy, :seriousness], _prefix: true
end
