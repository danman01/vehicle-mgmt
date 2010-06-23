# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100623135749) do

  create_table "locations", :primary_key => "building_dbid", :force => true do |t|
    t.string "building_number", :limit => 10
    t.string "name",            :limit => 200
    t.string "community",       :limit => 200
  end

  create_table "locations_trips", :id => false, :force => true do |t|
    t.integer "building_dbid"
    t.integer "trip_id"
  end

  create_table "reservations", :force => true do |t|
    t.integer  "fulfilled",      :default => 0
    t.integer  "trip_id"
    t.integer  "vehicle_id",                    :null => false
    t.string   "user_id"
    t.datetime "reserved_from"
    t.datetime "reserved_until"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", :primary_key => "trip_id", :force => true do |t|
    t.string   "vehicle_id",       :limit => 16
    t.string   "destination_name", :limit => 100
    t.string   "myid",             :limit => 40
    t.datetime "check_out_time"
    t.datetime "check_in_time"
    t.string   "comments"
    t.integer  "reservation_id"
  end

  create_table "users", :primary_key => "myid", :force => true do |t|
    t.string  "user_fname", :limit => 50
    t.string  "user_lname", :limit => 50
    t.string  "user_email", :limit => 50
    t.string  "user_group", :limit => 25
    t.text    "role",                     :default => "normal"
    t.integer "logged_in",                :default => 0
    t.text    "password"
  end

  add_index "users", ["myid"], :name => "sqlite_autoindex_users_1", :unique => true

  create_table "vehicles", :primary_key => "vehicleID", :force => true do |t|
    t.integer  "year_made"
    t.string   "make",              :limit => 14
    t.string   "model",             :limit => 20
    t.string   "owner",             :limit => 20
    t.string   "alias"
    t.string   "image_url"
    t.integer  "checked_out",                     :default => 0
    t.integer  "reserved",                        :default => 0
    t.integer  "needs_gas",                       :default => 0
    t.integer  "needs_service",                   :default => 0
    t.text     "service_comments"
    t.datetime "service_timestamp"
    t.string   "parking_id"
    t.string   "hows_my_driving"
  end

  add_index "vehicles", ["vehicleID"], :name => "sqlite_autoindex_vehicles_1", :unique => true

end
