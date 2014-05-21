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

ActiveRecord::Schema.define(version: 20140521043534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "phases", force: true do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.date     "end_date",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "phases", ["title"], name: "index_phases_on_title", using: :btree

  create_table "project_phases", force: true do |t|
    t.integer  "project_id", null: false
    t.integer  "phase_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "title",        null: false
    t.string   "course",       null: false
    t.string   "description",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "moderator_id"
  end

  add_index "projects", ["title"], name: "index_projects_on_title", using: :btree

  create_table "sessions", force: true do |t|
  end

  create_table "tasks", force: true do |t|
    t.string   "title",          null: false
    t.integer  "parent_task_id", null: false
    t.integer  "phase_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "tasks", ["title"], name: "index_tasks_on_title", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end