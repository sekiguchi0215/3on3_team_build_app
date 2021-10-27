class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  mount_uploader :icon, ImageUploader

  has_many :deck_lists, dependent: :destroy
  has_many :recruitments, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :entried_recruitment, through: :entries, source: :recruitment
end
