class Trip < ActiveRecord::Base
  set_primary_key :trip_id
belongs_to :vehicle
belongs_to :user, :foreign_key => "myid"
has_and_belongs_to_many :locations, :join_table => "locations_trips", :foreign_key=> "building_dbid", 
  :association_foreign_key => "trip_id"


       def self.find_current_trips
         find(:all, :conditions => {:check_in_time => nil})
       end
       
validates_presence_of :vehicle_id, :myid, :destination_name

validate :good_time 

def good_time

 errors.add(:bad_time, 'Must be this year, this isn\'t back to the future') if self.check_out_time.year!=Time.now.year 
end
  
end

# == Schema Information
#
# Table name: trips
#
#  trip_id          :integer         not null, primary key
#  vehicle_id       :string(16)
#  destination_name :string(100)
#  myid             :string(40)
#  check_out_time   :datetime
#  check_in_time    :datetime
#  comments         :string(255)
#  reservation_id   :integer
#

