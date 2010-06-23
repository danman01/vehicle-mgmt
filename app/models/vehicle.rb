class Vehicle < ActiveRecord::Base
  set_primary_keys :vehicleID
	has_many :trips
	has_many :reservations
	
	validates_uniqueness_of :parking_id
	validates_uniqueness_of :hows_my_driving
	
	
	def self.checked_out
     find(:all, :conditions => {:checked_out => 1})
   end
   def self.checked_in
      find(:all, :conditions => {:checked_out => 0})
    end
  def self.reserved
    find(:all, :conditions => {:reserved => 1})
  end
  def self.not_reserved
    find(:all, :conditions => {:reserved => 0})
  end
  def self.needs_gas
    find(:all, :conditions => {:needs_gas => 1})
    
  end
  
  def self.needs_service
    find(:all, :conditions => {:needs_service => 1})
    
  end
  
  
end


# == Schema Information
#
# Table name: vehicles
#
#  vehicleID         :string(10)
#  year_made         :integer
#  make              :string(14)
#  model             :string(20)
#  owner             :string(20)
#  alias             :string(255)
#  image_url         :string(255)
#  checked_out       :integer         default(0)
#  reserved          :integer         default(0)
#  needs_gas         :integer         default(0)
#  needs_service     :integer         default(0)
#  service_comments  :text
#  service_timestamp :datetime
#  parking_id        :string(255)
#

