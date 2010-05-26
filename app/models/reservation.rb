class Reservation < ActiveRecord::Base
  
   
  belongs_to :vehicle
  belongs_to :user, 
  		   :foreign_key => "myid"

         def self.find_current_reservations
           find_all_by_fulfilled(0)
         end

  validates_presence_of :vehicle_id, :user_id, :reserved_from, :reserved_until
  validate :valid_end_time
  validate :valid_start_time
  

      def valid_end_time
        errors.add_to_base("Reserved until must be later than reserved from") unless self.reserved_until>self.reserved_from
      end
      
      def valid_start_time
        errors.add_to_base("Cannot begin reservation before current time") unless self.reserved_from>Time.now-100
      end
  
  
end

# == Schema Information
#
# Table name: reservations
#
#  id             :integer         not null, primary key
#  fulfilled      :integer         default(0)
#  trip_id        :integer
#  vehicle_id     :integer         not null
#  user_id        :string(255)
#  reserved_from  :datetime
#  reserved_until :datetime
#  comments       :text
#  created_at     :datetime
#  updated_at     :datetime
#

