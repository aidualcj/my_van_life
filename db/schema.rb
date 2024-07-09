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

ActiveRecord::Schema[7.1].define(version: 2024_07_09_090023) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "status"
    t.decimal "price"
    t.string "date"
    t.bigint "message_id", null: false
    t.bigint "van_id", null: false
    t.bigint "user_id", null: false
    t.bigint "checking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checking_id"], name: "index_bookings_on_checking_id"
    t.index ["message_id"], name: "index_bookings_on_message_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["van_id"], name: "index_bookings_on_van_id"
  end

  create_table "checkings", force: :cascade do |t|
    t.text "details"
    t.string "photo"
    t.text "comment"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "van_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_messages_on_booking_id"
    t.index ["van_id"], name: "index_messages_on_van_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.decimal "rating"
    t.bigint "van_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["van_id"], name: "index_reviews_on_van_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vans", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "price_per_day"
    t.string "status"
    t.string "location"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photos"
    t.index ["user_id"], name: "index_vans_on_user_id"
  end

  add_foreign_key "bookings", "checkings"
  add_foreign_key "bookings", "messages"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "vans"
  add_foreign_key "messages", "bookings"
  add_foreign_key "messages", "vans"
  add_foreign_key "reviews", "vans"
  add_foreign_key "vans", "users"
end
