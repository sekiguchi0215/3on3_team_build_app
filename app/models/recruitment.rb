class Recruitment < ApplicationRecord
  belongs_to :user

  validates :event_title, presence: true
  validates :number_of_applicants, presence: true
  validates :recruitment_condition, presence: true
end
