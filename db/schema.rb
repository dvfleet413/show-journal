# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_09_040742) do

  create_table "composers", force: :cascade do |t|
    t.string "name"
    t.integer "birth_year"
    t.integer "death_year"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "viewing_id", null: false
    t.string "body"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["viewing_id"], name: "index_reviews_on_viewing_id"
  end

  create_table "shows", force: :cascade do |t|
    t.integer "composer_id", null: false
    t.integer "genre_id", null: false
    t.string "title"
    t.integer "first_performance_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "viewings_count"
    t.index ["composer_id"], name: "index_shows_on_composer_id"
    t.index ["genre_id"], name: "index_shows_on_genre_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "viewings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "show_id", null: false
    t.datetime "date"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["show_id"], name: "index_viewings_on_show_id"
    t.index ["user_id"], name: "index_viewings_on_user_id"
  end

  add_foreign_key "reviews", "viewings"
  add_foreign_key "shows", "composers"
  add_foreign_key "shows", "genres"
  add_foreign_key "viewings", "shows"
  add_foreign_key "viewings", "users"
end
