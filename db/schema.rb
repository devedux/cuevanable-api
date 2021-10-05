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

ActiveRecord::Schema.define(version: 2021_10_05_234824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "genre_id", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.string "summary", null: false
    t.bigint "professional_id"
    t.bigint "parent_id"
    t.integer "duration", null: false
    t.integer "category", default: 0
    t.date "release_date", null: false
    t.integer "likes_count", default: 0
    t.integer "dislikes_count", default: 0
    t.integer "votes_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_movies_on_parent_id"
    t.index ["professional_id"], name: "index_movies_on_professional_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "name"
    t.string "email", null: false
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "movies", "users", column: "professional_id"
end
