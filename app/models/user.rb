class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  mount_uploader :icon, ImageUploader

  # デッキ登録機能
  has_many :deck_lists, dependent: :destroy

  # 募集機能
  has_many :recruitments, dependent: :destroy

  # 応募機能
  has_many :entries, dependent: :destroy
  has_many :entried_recruitment, through: :entries, source: :recruitment

  # ダイレクトメッセージ機能
  has_many :rooms, dependent: :destroy
  has_many :direct_messages, dependent: :destroy

  # チーム機能
  has_many :members, dependent: :destroy
  has_many :teams, through: :members
end
