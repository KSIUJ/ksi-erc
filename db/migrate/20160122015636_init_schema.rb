class InitSchema < ActiveRecord::Migration
  def up
    
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    
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
      t.datetime "created_at",          null: false
      t.datetime "updated_at",          null: false
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
      t.integer "membership_id", null: false
      t.integer "role_id",       null: false
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
    
    add_foreign_key "book_leases", "books"
    add_foreign_key "book_leases", "members"
    add_foreign_key "books", "authors"
    add_foreign_key "books", "publishing_houses"
  end

  def down
    raise "Can not revert initial migration"
  end
end
