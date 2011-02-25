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

ActiveRecord::Schema.define(:version => 20101214155203) do

  create_table "groups", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "contact",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :primary_key => "building_dbid", :force => true do |t|
    t.string "building_number", :limit => 10,  :null => false
    t.string "name",            :limit => 200, :null => false
    t.string "community",       :limit => 200, :null => false
  end

  create_table "locations_trips", :id => false, :force => true do |t|
    t.integer "building_dbid", :null => false
    t.integer "trip_id",       :null => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "fulfilled",      :default => 0, :null => false
    t.integer  "trip_id",                       :null => false
    t.integer  "vehicle_id",                    :null => false
    t.string   "user_id",                       :null => false
    t.datetime "reserved_from",                 :null => false
    t.datetime "reserved_until",                :null => false
    t.text     "comments",                      :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "trips", :primary_key => "trip_id", :force => true do |t|
    t.string   "vehicle_id",       :limit => 16,  :null => false
    t.string   "destination_name", :limit => 100, :null => false
    t.string   "myid",             :limit => 40,  :null => false
    t.datetime "check_out_time",                  :null => false
    t.datetime "check_in_time",                   :null => false
    t.string   "comments",                        :null => false
    t.integer  "reservation_id",                  :null => false
  end

  create_table "users", :primary_key => "myid", :force => true do |t|
    t.string  "user_fname",      :limit => 50,                       :null => false
    t.string  "user_lname",      :limit => 50,                       :null => false
    t.string  "user_email",      :limit => 50,                       :null => false
    t.string  "user_group",      :limit => 25,                       :null => false
    t.text    "role",                          :default => "normal", :null => false
    t.integer "logged_in",                     :default => 0,        :null => false
    t.text    "password",                                            :null => false
    t.string  "hashed_password",                                     :null => false
    t.string  "salt",                                                :null => false
    t.integer "current_user",                                        :null => false
  end

  add_index "users", ["myid"], :name => "sqlite_autoindex_users_1", :unique => true

  create_table "vehicles", :primary_key => "vehicleID", :force => true do |t|
    t.integer  "year_made",                                      :null => false
    t.string   "make",              :limit => 14,                :null => false
    t.string   "model",             :limit => 20,                :null => false
    t.string   "owner",             :limit => 20,                :null => false
    t.string   "alias",                                          :null => false
    t.string   "image_url",                                      :null => false
    t.integer  "checked_out",                     :default => 0, :null => false
    t.integer  "reserved",                        :default => 0, :null => false
    t.integer  "needs_gas",                       :default => 0, :null => false
    t.integer  "needs_service",                   :default => 0, :null => false
    t.text     "service_comments",                               :null => false
    t.datetime "service_timestamp",                              :null => false
    t.string   "parking_id",                                     :null => false
    t.string   "hows_my_driving",                                :null => false
  end

  add_index "vehicles", ["vehicleID"], :name => "sqlite_autoindex_vehicles_1", :unique => true

end
