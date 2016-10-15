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

ActiveRecord::Schema.define(version: 20161015180635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "birthdays", force: :cascade do |t|
    t.date     "birthdate"
    t.time     "birthtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connections", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.index ["receiver_id"], name: "index_connections_on_receiver_id", using: :btree
    t.index ["sender_id"], name: "index_connections_on_sender_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "connection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["connection_id"], name: "index_messages_on_connection_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "complement"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.boolean  "charity"
    t.boolean  "gift"
    t.boolean  "travel"
    t.datetime "birthday"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "connections", "users", column: "receiver_id"
  add_foreign_key "connections", "users", column: "sender_id"
  add_foreign_key "messages", "connections"
  add_foreign_key "messages", "users"
  add_foreign_key "posts", "users"
end
