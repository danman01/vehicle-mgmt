class AddServiceTimeStampToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :service_timestamp, :datetime
    
  end

  def self.down
    remove_column :vehicles, :service_timestamp
  end
end
