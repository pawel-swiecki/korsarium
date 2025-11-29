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

ActiveRecord::Schema[8.1].define(version: 2025_11_29_194856) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "subtitle"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.text "introduction"
    t.text "summary"
    t.integer "textbook_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["textbook_id"], name: "index_lessons_on_textbook_id"
  end

  create_table "levels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "segment_id", null: false
    t.string "subtitle"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["segment_id"], name: "index_levels_on_segment_id"
  end

  create_table "segments", force: :cascade do |t|
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.string "subtitle"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_segments_on_course_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "textbooks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "level_id", null: false
    t.text "subtitle"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_textbooks_on_level_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest", null: false
    t.string "unconfirmed_email"
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "lessons", "textbooks"
  add_foreign_key "levels", "segments"
  add_foreign_key "segments", "courses"
  add_foreign_key "sessions", "users"
  add_foreign_key "textbooks", "levels"
end
