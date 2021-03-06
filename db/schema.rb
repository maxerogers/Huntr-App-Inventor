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

ActiveRecord::Schema.define(version: 20140927195230) do

  create_table "conversations", force: true do |t|
    t.integer "user_a_id"
    t.integer "user_b_id"
  end

  create_table "messages", force: true do |t|
    t.integer "conversation_id"
    t.integer "user_id"
    t.string  "data"
  end

  create_table "skills", force: true do |t|
    t.string "name"
  end

  create_table "skills_users", id: false, force: true do |t|
    t.integer "skill_id"
    t.integer "user_id"
  end

  create_table "tokens", force: true do |t|
    t.string "type"
    t.string "token"
    t.string "secret"
  end

  create_table "users", force: true do |t|
    t.string  "name"
    t.string  "blob"
    t.string  "location"
    t.string  "looking_for"
    t.boolean "employer",        default: false
    t.string  "password_digest"
    t.string  "email"
    t.string  "prog_type"
  end

end
