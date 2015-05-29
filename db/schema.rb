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

ActiveRecord::Schema.define(version: 20150529002158) do

  create_table "ratings", force: :cascade do |t|
    t.integer  "value",       limit: 1
    t.integer  "sentence_id"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "ratings", ["sentence_id"], name: "index_ratings_on_sentence_id"
  add_index "ratings", ["user_id", "sentence_id"], name: "index_ratings_on_user_id_and_sentence_id", unique: true
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "sentences", force: :cascade do |t|
    t.string   "sentence"
    t.integer  "word_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sentences", ["user_id"], name: "index_sentences_on_user_id"
  add_index "sentences", ["word_id", "user_id"], name: "index_sentences_on_word_id_and_user_id", unique: true
  add_index "sentences", ["word_id"], name: "index_sentences_on_word_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.boolean  "is_teacher"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "words", force: :cascade do |t|
    t.string   "word"
    t.string   "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
