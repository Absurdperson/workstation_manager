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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130930080009) do

  create_table "data_files", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "equipment", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "val"
    t.integer  "count"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "inbox_id"
    t.integer  "outbox_id"
    t.string   "description"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "equipment", ["user_id", "created_at", "name"], :name => "index_equipment_on_user_id_and_created_at_and_name"

  create_table "inbox_equipments", :force => true do |t|
    t.integer  "inbox_id"
    t.integer  "equipment_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "inboxes", :force => true do |t|
    t.string   "theme"
    t.integer  "user_id"
    t.integer  "partner_id",           :limit => 255
    t.integer  "equipment_id",         :limit => 255
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "partners"
    t.string   "equipments"
    t.string   "partner_value"
    t.string   "equipment_value"
    t.string   "letter"
    t.string   "letters_file_name"
    t.string   "letters_content_type"
    t.integer  "letters_file_size"
    t.datetime "letters_updated_at"
    t.string   "partner_name"
    t.string   "application_type"
  end

  add_index "inboxes", ["user_id", "created_at", "theme"], :name => "index_inboxes_on_user_id_and_created_at_and_theme"

  create_table "messages", :force => true do |t|
    t.string   "description"
    t.string   "partner_id"
    t.integer  "user_id"
    t.string   "letter_type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "letters_file_name"
    t.string   "letters_content_type"
    t.integer  "letters_file_size"
    t.datetime "letters_updated_at"
  end

  create_table "outbox_equipments", :force => true do |t|
    t.integer  "outbox_id"
    t.integer  "equipment_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "outboxes", :force => true do |t|
    t.string   "theme"
    t.integer  "user_id"
    t.integer  "partner_id",           :limit => 255
    t.integer  "equipment_id",         :limit => 255
    t.integer  "inbox_id",             :limit => 255
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "letters_file_name"
    t.string   "letters_content_type"
    t.integer  "letters_file_size"
    t.datetime "letters_updated_at"
    t.string   "application_type"
  end

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.integer  "inbox_id"
    t.integer  "outbox_id"
    t.string   "bin"
    t.string   "director"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
