# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = "password"

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
