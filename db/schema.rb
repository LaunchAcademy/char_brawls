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

ActiveRecord::Schema.define(version: 20140926180604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resource_uri"
    t.string   "photo"
  end

  add_index "characters", ["name"], name: "index_characters_on_name", unique: true, using: :btree

  create_table "matchups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_id", null: false
    t.integer  "opponent_id",  null: false
  end

  add_index "matchups", ["character_id", "opponent_id"], name: "index_matchups_on_character_id_and_opponent_id", unique: true, using: :btree

  create_table "opinions", force: true do |t|
    t.string   "body",       null: false
    t.integer  "matchup_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winner_id",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                                null: false
    t.string   "last_name",                                 null: false
    t.string   "profile_photo"
    t.string   "role",                   default: "member", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
