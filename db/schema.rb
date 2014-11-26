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

ActiveRecord::Schema.define(version: 20141125213013) do

  create_table "comments", force: true do |t|
    t.integer  "sentence_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["sentence_id"], name: "index_comments_on_sentence_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "paragraphs", force: true do |t|
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "paragraphs", ["story_id"], name: "index_paragraphs_on_story_id"

  create_table "sentences", force: true do |t|
    t.integer  "paragraph_id"
    t.text     "body"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sentences", ["paragraph_id"], name: "index_sentences_on_paragraph_id"

  create_table "stories", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "photo"
    t.string   "role"
    t.string   "oauthtoken"
    t.string   "oauthrefresh"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
