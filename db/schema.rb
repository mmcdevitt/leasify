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

ActiveRecord::Schema.define(version: 20140324215026) do

  create_table "amenities", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "availabilities", force: true do |t|
    t.string   "title"
    t.string   "suite_or_floor"
    t.string   "availability"
    t.integer  "sf"
    t.integer  "rental_rate"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.integer  "floor_location"
    t.string   "type_of_space"
  end

  create_table "availability_galleries", force: true do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.integer  "availability_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "availability_image_file_name"
    t.string   "availability_image_content_type"
    t.integer  "availability_image_file_size"
    t.datetime "availability_image_updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "job_title"
    t.string   "phone"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "homepage_galleries", force: true do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "homepage_gallery_image_file_name"
    t.string   "homepage_gallery_image_content_type"
    t.integer  "homepage_gallery_image_file_size"
    t.datetime "homepage_gallery_image_updated_at"
    t.integer  "theme_option_id"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "page_image_file_name"
    t.string   "page_image_content_type"
    t.integer  "page_image_file_size"
    t.datetime "page_image_updated_at"
    t.integer  "site_id"
    t.string   "slug"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "slug"
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug"

  create_table "property_informations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "owner_name"
    t.string   "property_class"
    t.integer  "floors"
    t.integer  "sf"
    t.integer  "year_built"
    t.string   "address"
    t.string   "state"
    t.string   "city"
    t.integer  "zipcode"
    t.integer  "site_id"
    t.boolean  "kitchen"
    t.boolean  "showers"
    t.boolean  "reception"
    t.boolean  "patio"
    t.boolean  "parking_garage"
    t.boolean  "lobby_attendant"
    t.boolean  "cafeteria"
    t.boolean  "onsite_security"
    t.boolean  "bathrooms"
    t.boolean  "fitness_center"
    t.boolean  "bicycles_allowed"
    t.boolean  "bicycle_storage"
    t.boolean  "dog_friendly"
  end

  create_table "sidebar_links", force: true do |t|
    t.string   "name"
    t.string   "link_to"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "theme_names", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "theme_name_image_file_name"
    t.string   "theme_name_image_content_type"
    t.integer  "theme_name_image_file_size"
    t.datetime "theme_name_image_updated_at"
  end

  create_table "theme_options", force: true do |t|
    t.string   "homepage_heading",                        default: "Welcome to Our Site!"
    t.string   "homepage_subheading",                     default: "You can write something else here."
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "theme_image_file_name"
    t.string   "theme_image_content_type"
    t.integer  "theme_image_file_size"
    t.datetime "theme_image_updated_at"
    t.integer  "user_id"
    t.integer  "template",                    limit: 255
    t.string   "homepage_image_file_name"
    t.string   "homepage_image_content_type"
    t.integer  "homepage_image_file_size"
    t.datetime "homepage_image_updated_at"
    t.integer  "site_id"
    t.string   "body_font",                               default: "arial"
    t.boolean  "show_logo"
    t.string   "heading_font",                            default: "museo-h-bold"
    t.integer  "mainheading_size",                        default: 48
    t.integer  "nav_size",                                default: 12
    t.integer  "subheading_size",                         default: 14
    t.integer  "footer_size",                             default: 12
    t.integer  "body_size",                               default: 14
    t.string   "mainheading_color",                       default: "fff"
    t.string   "subheading_color",                        default: "fff"
    t.string   "body_color",                              default: "fff"
    t.string   "footer_color",                            default: "fff"
    t.string   "nav_color",                               default: "fff"
    t.string   "navhover_color",                          default: "f5f5f5"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
