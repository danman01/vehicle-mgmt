class AddParkingIdToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :parking_id, :string
  end

  def self.down
    remove_column :vehicles, :parking_id
  end
end
