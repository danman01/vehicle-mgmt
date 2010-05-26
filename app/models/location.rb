class Location < ActiveRecord::Base
  set_primary_key :building_dbid
  
  has_and_belongs_to_many :trips, :join_table => "locations_trips", :foreign_key=> "trip_id", 
    :association_foreign_key => "building_dbid"
  
	validates_presence_of :building_number, :name
	validates_uniqueness_of :building_number
	validates_uniqueness_of :name
  
end

# == Schema Information
#
# Table name: locations
#
#  building_dbid   :integer         not null, primary key
#  building_number :string(10)
#  name            :string(200)
#  community       :string(200)
#

