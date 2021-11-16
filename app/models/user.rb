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
  has_many :room_keys, dependent: :destroy
  has_many :rooms, through: :room_keys, dependent: :destroy
  has_many :direct_messages, dependent: :destroy

  # チーム機能
  has_many :members, dependent: :destroy
  has_many :teams, through: :members

  # チームメッセージ機能
  has_many :team_messages, dependent: :destroy

  # 通知機能 active: 自分からの通知, passive: 相手からの通知
  has_many :active_notificatons, class_name: "Notification", foreign_key: "visitor_id", dependent: :destroy
  has_many :pasive_notificatons, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy
end
