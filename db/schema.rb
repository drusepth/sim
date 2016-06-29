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

ActiveRecord::Schema.define(version: 20160629070902) do

  create_table "lifeforms", force: :cascade do |t|
    t.string   "name"
    t.string   "owner"
    t.integer  "parent_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "world_id"
    t.integer  "age"
    t.float    "hunger_score"
    t.float    "temperature"
    t.float    "current_health"
    t.float    "maximum_health"
    t.datetime "died_at"
  end

  add_index "lifeforms", ["parent_id"], name: "index_lifeforms_on_parent_id"
  add_index "lifeforms", ["world_id"], name: "index_lifeforms_on_world_id"

  create_table "vegetations", force: :cascade do |t|
    t.string   "name"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "world_id"
  end

  add_index "vegetations", ["world_id"], name: "index_vegetations_on_world_id"

  create_table "worlds", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "ended_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "temperature", default: 50.0
  end

end
