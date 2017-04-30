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

ActiveRecord::Schema.define(version: 20170430225808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "match_id",   null: false
    t.string   "player_id",  null: false
    t.string   "type",       null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string   "match_id",   null: false
    t.string   "player_id",  null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string   "local",           null: false
    t.string   "visitor",         null: false
    t.integer  "date",            null: false
    t.string   "tournament_name", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "nominates", force: :cascade do |t|
    t.string   "team_id",    null: false
    t.string   "match_id",   null: false
    t.string   "player_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizers", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "password",   null: false
    t.string   "mail",       null: false
    t.integer  "age",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mail"], name: "index_organizers_on_mail", unique: true, using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "password",   null: false
    t.string   "mail",       null: false
    t.string   "position",   null: false
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mail"], name: "index_players_on_mail", unique: true, using: :btree
  end

  create_table "teamplayers", force: :cascade do |t|
    t.string   "player_id",  null: false
    t.string   "team_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "capitan"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_teams_on_name", using: :btree
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "organizer",  null: false
    t.string   "place",      null: false
    t.string   "bases"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tournaments_on_name", using: :btree
  end

  create_table "tournamentteams", force: :cascade do |t|
    t.string   "tournament_id", null: false
    t.string   "team_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
