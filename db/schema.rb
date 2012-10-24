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

ActiveRecord::Schema.define(:version => 20121016044231) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delivereds", :force => true do |t|
    t.integer  "reminder_id"
    t.integer  "task_id"
    t.datetime "lastdelivered"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reminders", :force => true do |t|
    t.text     "isi_email"
    t.datetime "waktu_reminder"
    t.string   "occurance"
    t.datetime "waktu_berakhir"
    t.integer  "task_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "reminders", ["task_id"], :name => "index_reminders_on_task_id"

  create_table "tasks", :force => true do |t|
    t.string   "email_user"
    t.string   "judul_task"
    t.datetime "tgl_task"
    t.text     "tempat_task"
    t.text     "ket_task"
    t.string   "status"
    t.string   "kategori"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "department"
    t.integer  "id_user"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  create_table "users", :force => true do |t|
    t.string   "nama"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "department"
    t.string   "email"
  end

end
