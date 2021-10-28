# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_28_153552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deck_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "deck_list", null: false
    t.integer "status", default: 0, null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_deck_lists_on_user_id"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recruitment_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recruitment_id"], name: "index_entries_on_recruitment_id"
    t.index ["user_id", "recruitment_id"], name: "index_entries_on_user_id_and_recruitment_id", unique: true
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "recruitments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "number_of_applicants", null: false
    t.string "event_title", null: false
    t.integer "recruitment_condition", null: false
    t.text "introduction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "entries_count", default: 0
    t.index ["user_id"], name: "index_recruitments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "icon"
    t.text "introduction"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "deck_lists", "users"
  add_foreign_key "entries", "recruitments"
  add_foreign_key "entries", "users"
  add_foreign_key "recruitments", "users"
end
