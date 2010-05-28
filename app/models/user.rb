class User < ActiveRecord::Base
  set_primary_keys :myid
	has_many :trips
	has_many :reservations
	
	
	
	USER_GROUPS = [
	  #displayed       stored in db
	  ["STS",            "STS"],
	  ["Special Projects", "Special Projects"],
	  ["NOC",              "NOC"]
	  
	  
	  ]
	  validates_presence_of :myid, :user_fname, :user_lname, :user_group
	  validates_inclusion_of :user_group, :in=>
	    USER_GROUPS.map {|disp, value| value}
end


# == Schema Information
#
# Table name: users
#
#  myid       :string(40)
#  user_fname :string(50)
#  user_lname :string(50)
#  user_email :string(50)
#  user_group :string(25)
#  role       :text            default("normal")
#  logged_in  :integer         default(0)
#  password   :text
#

