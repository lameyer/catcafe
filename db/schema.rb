# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150815202213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cafe_items", force: :cascade do |t|
    t.integer  "cafe_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cafes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "cats", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.string   "breed"
    t.string   "color"
    t.string   "personality"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "first_name"
    t.string   "image"
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "cat_id"
    t.integer  "cafe_id"
    t.datetime "entered_at"
    t.datetime "exited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
