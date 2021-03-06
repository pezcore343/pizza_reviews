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

ActiveRecord::Schema.define(version: 20150107181152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.text     "body",       null: false
    t.integer  "user_id",    null: false
    t.integer  "review_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["review_id"], name: "index_comments_on_review_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "pizzerias", force: :cascade do |t|
    t.string "name",     null: false
    t.string "street",   null: false
    t.string "city",     null: false
    t.string "state",    null: false
    t.string "zip_code", null: false
    t.string "phone"
    t.string "website"
    t.string "photo"
  end

  add_index "pizzerias", ["name", "street", "city", "state"], name: "address", unique: true, using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "body",        null: false
    t.integer  "rating",      null: false
    t.integer  "pizzeria_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  add_index "reviews", ["pizzeria_id"], name: "index_reviews_on_pizzeria_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",                               null: false
    t.string   "first_name"
    t.string   "last_initial"
    t.text     "bio"
    t.string   "avatar"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "review_id",  null: false
    t.integer  "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["review_id", "user_id"], name: "index_votes_on_review_id_and_user_id", unique: true, using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
