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

ActiveRecord::Schema.define(version: 20160910143711) do

  create_table "expired_tokens", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proverbs", force: :cascade do |t|
    t.string   "body"
    t.string   "language"
    t.string   "status",     default: "unapproved"
    t.integer  "root_id",    default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
  end

  add_index "proverbs", ["root_id"], name: "index_proverbs_on_root_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "proverb_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["proverb_id"], name: "index_taggings_on_proverb_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fb_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_type",  default: 0
  end

end
