# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_29_223018) do
  create_table "child_categories", force: :cascade do |t|
    t.string "title"
    t.integer "parent_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_category_id"], name: "index_child_categories_on_parent_category_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "note_id", null: false
    t.string "image_path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_name", null: false
    t.index ["note_id"], name: "index_images_on_note_id"
  end

  create_table "links", force: :cascade do |t|
    t.integer "note_id", null: false
    t.string "link", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_name"
    t.index ["note_id"], name: "index_links_on_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "child_category_id"
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_category_id"], name: "index_notes_on_child_category_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "parent_categories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parent_categories_on_user_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "value"
    t.datetime "expiry"
    t.string "ip"
    t.datetime "revocation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "child_categories", "parent_categories"
  add_foreign_key "images", "notes"
  add_foreign_key "links", "notes"
  add_foreign_key "notes", "child_categories"
  add_foreign_key "notes", "users"
  add_foreign_key "parent_categories", "users"
end
