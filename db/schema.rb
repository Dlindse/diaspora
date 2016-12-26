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

ActiveRecord::Schema.define(version: 20161226044632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.string   "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "influences", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "pubdate"
    t.string   "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "book"
  end

  create_table "references", force: :cascade do |t|
    t.string   "name"
    t.integer  "work_id"
    t.string   "page"
    t.string   "line"
    t.integer  "genre_id"
    t.text     "excerpt"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "influence_id"
    t.index ["genre_id"], name: "index_references_on_genre_id", using: :btree
    t.index ["influence_id"], name: "index_references_on_influence_id", using: :btree
    t.index ["work_id"], name: "index_references_on_work_id", using: :btree
  end

  create_table "works", force: :cascade do |t|
    t.string   "title"
    t.integer  "author_id"
    t.string   "published"
    t.string   "edition"
    t.string   "collection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_works_on_author_id", using: :btree
  end

  add_foreign_key "references", "genres"
  add_foreign_key "references", "influences"
  add_foreign_key "references", "works"
  add_foreign_key "works", "authors"
end
