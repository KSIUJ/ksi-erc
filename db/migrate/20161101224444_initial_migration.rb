class InitialMigration < ActiveRecord::Migration
  def up
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    enable_extension "pgcrypto"

    create_table "authors", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "book_leases", force: :cascade do |t|
      t.datetime "date_start"
      t.datetime "date_end"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "member_id"
      t.boolean  "active"
      t.integer  "book_id"
    end

    add_index "book_leases", ["book_id"], name: "index_book_leases_on_book_id", using: :btree
    add_index "book_leases", ["member_id"], name: "index_book_leases_on_member_id", using: :btree

    create_table "books", force: :cascade do |t|
      t.string   "title"
      t.integer  "year"
      t.boolean  "available",           default: true
      t.datetime "created_at",                         null: false
      t.datetime "updated_at",                         null: false
      t.integer  "publishing_house_id"
      t.integer  "author_id"
    end

    add_index "books", ["author_id"], name: "index_books_on_author_id", using: :btree
    add_index "books", ["publishing_house_id"], name: "index_books_on_publishing_house_id", using: :btree

    create_table "comments", force: :cascade do |t|
      t.string   "text"
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
      t.integer  "membership_id"
    end

    create_table "members", force: :cascade do |t|
      t.string   "name"
      t.string   "surname"
      t.string   "email"
      t.string   "card_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "memberships", force: :cascade do |t|
      t.boolean  "fee_paid"
      t.boolean  "tshirt"
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
      t.integer  "member_id"
      t.integer  "period_id"
      t.integer  "who_signed_up"
    end

    create_table "memberships_roles", id: false, force: :cascade do |t|
      t.integer "membership_id"
      t.integer "role_id"
    end

    create_table "periods", force: :cascade do |t|
      t.decimal  "fee"
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
      t.string   "info"
      t.string   "academic_year"
    end

    create_table "publishing_houses", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "roles", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "users", force: :cascade do |t|
      t.string   "email",            null: false
      t.string   "crypted_password"
      t.string   "salt"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

    add_foreign_key "book_leases", "books", name: "book_leases_book_id_fkey"
    add_foreign_key "book_leases", "members", name: "book_leases_member_id_fkey"
    add_foreign_key "books", "authors", name: "books_author_id_fkey"
    add_foreign_key "books", "publishing_houses", name: "books_publishing_house_id_fkey"
    add_foreign_key "comments", "memberships", name: "comments_membership_id_fkey"
    add_foreign_key "memberships", "members", name: "memberships_member_id_fkey"
    add_foreign_key "memberships", "periods", name: "memberships_period_id_fkey"
    add_foreign_key "memberships", "users", column: "who_signed_up", name: "memberships_who_signed_up_fkey"
    add_foreign_key "memberships_roles", "memberships", name: "memberships_roles_membership_id_fkey"
    add_foreign_key "memberships_roles", "roles", name: "memberships_roles_role_id_fkey"
  end

  def down
    raise "Can not revert initial migration"
  end
end