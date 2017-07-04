# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170704015247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_sub_comments", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "sub_comments_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "date_created"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.string "players"
    t.string "violence_rating"
    t.string "description"
    t.integer "rating"
    t.string "img"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "rating"
    t.integer "user_id"
    t.datetime "date_created"
  end

  create_table "user_friends", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "user_games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "name"
    t.integer "age"
    t.integer "rating"
    t.integer "number_of_posts"
    t.integer "visibility"
    t.datetime "date_joined"
  end

end
