# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = "password"

AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password") if Rails.env.development?

puts "管理ユーザーの初期データの投入に成功しました。"

User.create!(
  nickname: "test1",
  introduction: "テストユーザー１",
  email: "test1@example.com",
  password: password,
)

User.create!(
  nickname: "test2",
  introduction: "テストユーザー2",
  email: "test2@example.com",
  password: password,
)

User.create!(
  nickname: "test3",
  introduction: "テストユーザー3",
  email: "test3@example.com",
  password: password,
)

User.create!(
  nickname: "test4",
  introduction: "テストユーザー4",
  email: "test4@example.com",
  password: password,
)

puts "ユーザーの初期データの投入に成功しました。"

DeckList.create!(
  user_id: 2,
  deck_list: File.open("public/images/bondbluehybrid.jpg"),
  status: "public",
  content: "青絆ハイブリッド",
)

DeckList.create!(
  user_id: 2,
  deck_list: File.open("public/images/blackwargreymon.jpg"),
  status: "public",
  content: "黒ブラウォ",
)

DeckList.create!(
  user_id: 3,
  deck_list: File.open("public/images/bluehybrid.jpg"),
  status: "public",
  content: "青ハイ",
)

DeckList.create!(
  user_id: 3,
  deck_list: File.open("public/images/jesmon.jpg"),
  status: "public",
  content: "ジエス",
)

DeckList.create!(
  user_id: 4,
  deck_list: File.open("public/images/x-antibody.jpg"),
  status: "public",
  content: "X抗体",
)

DeckList.create!(
  user_id: 4,
  deck_list: File.open("public/images/yellowhybrid.jpg"),
  status: "public",
  content: "黄ハイ",
)

puts "デッキリストの初期データの投入に成功しました。"
