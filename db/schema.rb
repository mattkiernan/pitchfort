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

ActiveRecord::Schema.define(version: 20141201194609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: true do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.date     "datetime"
    t.integer  "client_id",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "announcements", ["client_id"], name: "index_announcements_on_client_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "coverage_topics", force: true do |t|
    t.integer  "topic_id",      null: false
    t.integer  "journalist_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "coverage_topics", ["journalist_id"], name: "index_coverage_topics_on_journalist_id", using: :btree
  add_index "coverage_topics", ["topic_id"], name: "index_coverage_topics_on_topic_id", using: :btree

  create_table "journalists", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name"
    t.string   "email"
    t.integer  "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pitch_topics", force: true do |t|
    t.integer  "pitch_id",   null: false
    t.integer  "topic_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pitches", force: true do |t|
    t.string   "subject",                            null: false
    t.text     "body",                               null: false
    t.string   "press_release_url"
    t.string   "status",            default: "Sent", null: false
    t.integer  "announcement_id",                    null: false
    t.datetime "datetime"
    t.integer  "journalist_id",                      null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "pitches", ["announcement_id"], name: "index_pitches_on_announcement_id", using: :btree
  add_index "pitches", ["journalist_id"], name: "index_pitches_on_journalist_id", using: :btree

  create_table "publication_contributions", force: true do |t|
    t.integer  "journalist_id",  null: false
    t.integer  "publication_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "publications", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
