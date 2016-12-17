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

ActiveRecord::Schema.define(version: 20161217001706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "title"
    t.integer  "user_id"
    t.string   "json"
    t.json     "data"
    t.string   "file"
    t.string   "filetwo"
    t.string   "filethree"
    t.string   "filefour"
    t.string   "filefive"
    t.string   "author"
    t.string   "tags"
    t.string   "coauthorone"
    t.string   "coauthortwo"
    t.string   "coauthorthree"
    t.string   "coauthorfour"
    t.string   "coauthorfive"
    t.string   "manifestVersion"
    t.string   "resObjTitle"
    t.string   "resObjAbstract"
    t.string   "resObjDate"
    t.string   "resObjDateLabel"
    t.string   "privacyOSight"
    t.string   "privacyIConsent"
    t.string   "privacyAnonData"
    t.string   "privacyConsiderations"
    t.string   "provenanceNarrative"
    t.string   "publication"
    t.string   "locationURL"
    t.string   "locationComment"
    t.string   "filePermissions"
    t.string   "creators"
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
    t.string   "username"
    t.date     "birthday"
    t.integer  "usertype"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
