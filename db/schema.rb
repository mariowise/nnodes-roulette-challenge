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

ActiveRecord::Schema.define(version: 20160424220656) do

  create_table "bets", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "amount"
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "target"
  end

  add_index "bets", ["game_id"], name: "index_bets_on_game_id"
  add_index "bets", ["player_id"], name: "index_bets_on_player_id"

  create_table "forecasts", force: :cascade do |t|
    t.date    "date"
    t.string  "text"
    t.boolean "rain", default: false
  end

  add_index "forecasts", ["date"], name: "index_forecasts_on_date"

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "result"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  add_index "players", ["deleted_at"], name: "index_players_on_deleted_at"

end
