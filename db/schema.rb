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

ActiveRecord::Schema.define(version: 20140121220157) do

  create_table "player_stats", force: true do |t|
    t.string   "name"
    t.integer  "rounds",      default: 0
    t.integer  "roundswon",   default: 0
    t.integer  "matches",     default: 0
    t.integer  "matcheswon",  default: 0
    t.integer  "goals",       default: 0
    t.integer  "shootgoals",  default: 0
    t.integer  "assists",     default: 0
    t.integer  "throws",      default: 0
    t.integer  "passes",      default: 0
    t.integer  "turnovers",   default: 0
    t.integer  "tackles",     default: 0
    t.integer  "tacklesagst", default: 0
    t.integer  "selfpass",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "round_users", force: true do |t|
    t.integer "user_id"
    t.integer "round_id"
    t.boolean "win"
    t.boolean "assist"
    t.boolean "goal"
    t.integer "users_id"
    t.integer "rounds_id"
  end

  create_table "rounds", force: true do |t|
    t.string   "server_name_code"
    t.float    "duration_seconds"
    t.integer  "player_count"
    t.integer  "win_team_players"
    t.integer  "lose_team_players"
    t.string   "map_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "alias"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_rounds"
    t.integer  "rounds_won"
    t.integer  "goals"
    t.integer  "assists"
  end

end
