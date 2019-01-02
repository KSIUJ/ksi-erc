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

ActiveRecord::Schema.define(version: 2019_01_02_134613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "discord_id"
    t.boolean "do_not_contact", default: false
  end

  create_table "memberships", id: :serial, force: :cascade do |t|
    t.boolean "fee_paid"
    t.boolean "tshirt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.integer "period_id"
    t.integer "registrar_id"
  end

  create_table "memberships_roles", id: false, force: :cascade do |t|
    t.integer "membership_id"
    t.integer "role_id"
  end

  create_table "periods", id: :serial, force: :cascade do |t|
    t.decimal "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "info"
    t.date "begin"
    t.date "end"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "memberships", "members", name: "memberships_member_id_fkey"
  add_foreign_key "memberships", "periods", name: "memberships_period_id_fkey"
  add_foreign_key "memberships", "users", column: "registrar_id", name: "memberships_who_signed_up_fkey"
  add_foreign_key "memberships_roles", "memberships", name: "memberships_roles_membership_id_fkey"
  add_foreign_key "memberships_roles", "roles", name: "memberships_roles_role_id_fkey"
end
