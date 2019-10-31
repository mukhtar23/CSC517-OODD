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

ActiveRecord::Schema.define(version: 2018_10_08_185025) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.integer "year_founded"
    t.text "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "revenue"
    t.string "size"
  end

  create_table "houses", force: :cascade do |t|
    t.string "location"
    t.float "square_ft"
    t.integer "year_built"
    t.integer "style"
    t.float "price"
    t.integer "floor"
    t.boolean "basement"
    t.string "owner"
    t.string "contact_info"
    t.integer "realtor_id"
    t.integer "company_id"
    t.string "pic_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_houses_on_company_id"
    t.index ["realtor_id"], name: "index_houses_on_realtor_id"
  end

  create_table "hunters", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hunters_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "subject"
    t.string "message"
    t.string "response"
    t.integer "hunter_id"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_inquiries_on_house_id"
    t.index ["hunter_id"], name: "index_inquiries_on_hunter_id"
  end

  create_table "interests", force: :cascade do |t|
    t.integer "house_id"
    t.integer "hunter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "realtors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_realtors_on_company_id"
    t.index ["user_id"], name: "index_realtors_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "location"
    t.decimal "max_price"
    t.decimal "min_price"
    t.decimal "max_footage"
    t.decimal "min_footage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.integer "phone"
    t.integer "contact_method"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
