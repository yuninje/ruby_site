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

ActiveRecord::Schema.define(version: 2019_05_04_000111) do

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

  create_table "animal_comments", force: :cascade do |t|
    t.integer "commenter_id"
    t.text "body"
    t.integer "animal_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_post_id"], name: "index_animal_comments_on_animal_post_id"
  end

  create_table "animal_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "author_id"
    t.integer "view_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commenter_id"
    t.text "body"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "game_comments", force: :cascade do |t|
    t.integer "commenter_id"
    t.text "body"
    t.integer "game_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_post_id"], name: "index_game_comments_on_game_post_id"
  end

  create_table "game_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "author_id"
    t.integer "view_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "humor_comments", force: :cascade do |t|
    t.integer "commenter_id"
    t.text "body"
    t.integer "humor_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["humor_post_id"], name: "index_humor_comments_on_humor_post_id"
  end

  create_table "humor_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "author_id"
    t.integer "view_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issue_comments", force: :cascade do |t|
    t.integer "commenter_id"
    t.text "body"
    t.integer "issue_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_post_id"], name: "index_issue_comments_on_issue_post_id"
  end

  create_table "issue_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "author_id"
    t.integer "view_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_comments", force: :cascade do |t|
    t.integer "commenter_id"
    t.text "body"
    t.integer "news_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_post_id"], name: "index_news_comments_on_news_post_id"
  end

  create_table "news_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "author_id"
    t.integer "view_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "author_id"
    t.string "genre"
    t.integer "view_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
