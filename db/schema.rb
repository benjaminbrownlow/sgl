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

ActiveRecord::Schema.define(version: 20141127005125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.integer  "player_id"
    t.integer  "tournament_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bracket_id"
  end

  add_index "activities", ["bracket_id"], name: "index_activities_on_bracket_id", using: :btree
  add_index "activities", ["tournament_id"], name: "index_activities_on_tournament_id", using: :btree

  create_table "brackets", force: true do |t|
    t.integer  "tournament_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brackets", ["tournament_id"], name: "index_brackets_on_tournament_id", using: :btree

  create_table "matches", force: true do |t|
    t.integer  "bracket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_ids", default: [], array: true
    t.datetime "matchDate"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "",    null: false
    t.string   "evetag"
    t.integer  "totalGames",             default: 0,     null: false
    t.integer  "totalWins",              default: 0,     null: false
    t.boolean  "admin",                  default: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.integer  "tournaments_id"
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["evetag"], name: "index_players_on_evetag", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree
  add_index "players", ["tournaments_id"], name: "index_players_on_tournaments_id", using: :btree

  create_table "tournaments", force: true do |t|
    t.string   "title"
    t.integer  "totalPlayers",       default: 0,                     null: false
    t.integer  "totalMatches",       default: 0,                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.datetime "signUpDate",         default: '2014-10-09 00:17:17', null: false
    t.datetime "gameDate",           default: '2014-10-11 14:59:42', null: false
    t.integer  "players_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "tournaments", ["players_id"], name: "index_tournaments_on_players_id", using: :btree

end
