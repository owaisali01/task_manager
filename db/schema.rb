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

ActiveRecord::Schema.define(version: 20230119125311) do

  create_table "assigned_tasks", force: true do |t|
    t.integer "user_id"
    t.integer "task_id"
  end

  add_index "assigned_tasks", ["task_id"], name: "index_assigned_tasks_on_task_id"
  add_index "assigned_tasks", ["user_id"], name: "index_assigned_tasks_on_user_id"

  create_table "board_sections", force: true do |t|
    t.string  "name"
    t.integer "board_id"
  end

  add_index "board_sections", ["board_id"], name: "index_board_sections_on_board_id"

  create_table "boards", force: true do |t|
    t.string   "name"
    t.string   "board_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id"

  create_table "comments", force: true do |t|
    t.string  "description"
    t.integer "task_id"
    t.integer "user_id"
  end

  add_index "comments", ["task_id"], name: "index_comments_on_task_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "sub_tasks", force: true do |t|
    t.string   "name"
    t.string   "status"
    t.string   "description"
    t.datetime "due_date"
    t.integer  "task_id"
  end

  add_index "sub_tasks", ["task_id"], name: "index_sub_tasks_on_task_id"

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "status"
    t.datetime "due_date"
    t.string   "story_point"
    t.integer  "board_id"
    t.integer  "board_section_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["board_id"], name: "index_tasks_on_board_id"
  add_index "tasks", ["board_section_id"], name: "index_tasks_on_board_section_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
