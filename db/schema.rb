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

ActiveRecord::Schema.define(version: 20140717142642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.string   "email"
    t.string   "lastfm"
    t.string   "bandcamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_path"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "format"
    t.string   "genre"
    t.string   "style"
    t.string   "label"
    t.text     "review"
    t.decimal  "rating",           precision: 2, scale: 1
    t.integer  "price_in_cents"
    t.boolean  "doomtown_release"
    t.integer  "band_id"
    t.string   "cover_art"
    t.date     "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "band_name"
    t.string   "bandcamp_id"
  end

  add_index "products", ["band_name"], name: "index_products_on_band_name", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree

  create_table "shows", force: true do |t|
    t.string   "club_name"
    t.string   "city"
    t.string   "country"
    t.date     "date"
    t.integer  "band_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
