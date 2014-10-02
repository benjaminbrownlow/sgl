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

ActiveRecord::Schema.define(version: 20141002022022) do

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
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true

  create_table "tournaments", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "signUpDate"
    t.datetime "gameDate"
    t.integer  "totalPlayers", default: 0, null: false
    t.integer  "totalMatches", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
