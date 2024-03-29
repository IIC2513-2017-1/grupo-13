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

ActiveRecord::Schema.define(version: 20170703062905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "player_id"
    t.integer  "goals"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "yellow_cards"
    t.integer  "red_cards"
    t.string   "match_id"
    t.index ["player_id", "match_id"], name: "index_events_on_player_id_and_match_id", unique: true, using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.string   "local",         null: false
    t.string   "visitor",       null: false
    t.integer  "date",          null: false
    t.string   "tournament_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "nominates", force: :cascade do |t|
    t.string   "team_id",    null: false
    t.string   "match_id",   null: false
    t.string   "player_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id", "team_id", "match_id"], name: "index_nominates_on_player_id_and_team_id_and_match_id", unique: true, using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "mail",                                null: false
    t.string   "position",                            null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "password_digest"
    t.boolean  "is_organizer"
    t.datetime "birthday"
    t.boolean  "email_confirmed",     default: false
    t.string   "confirm_token"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "token"
    t.index ["mail"], name: "index_players_on_mail", unique: true, using: :btree
    t.index ["token"], name: "index_players_on_token", unique: true, using: :btree
  end

  create_table "results", force: :cascade do |t|
    t.integer  "match_id",   null: false
    t.integer  "local",      null: false
    t.integer  "visitor",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id", "local", "visitor"], name: "index_results_on_match_id_and_local_and_visitor", unique: true, using: :btree
  end

  create_table "teamplayers", force: :cascade do |t|
    t.string   "player_id",                  null: false
    t.string   "team_id",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "i_team",     default: false
    t.boolean  "i_player",   default: false
    t.index ["team_id", "player_id"], name: "index_teamplayers_on_team_id_and_player_id", unique: true, using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "capitan"
    t.string   "logo"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.index ["name"], name: "index_teams_on_name", using: :btree
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "organizer",   null: false
    t.string   "place",       null: false
    t.string   "bases"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "number_date", null: false
    t.integer  "number_team", null: false
    t.index ["name"], name: "index_tournaments_on_name", using: :btree
  end

  create_table "tournamentteams", force: :cascade do |t|
    t.string   "tournament_id",                 null: false
    t.string   "team_id",                       null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "i_tournament",  default: false
    t.boolean  "i_team",        default: false
    t.index ["tournament_id", "team_id"], name: "index_tournamentteams_on_tournament_id_and_team_id", unique: true, using: :btree
  end

end
