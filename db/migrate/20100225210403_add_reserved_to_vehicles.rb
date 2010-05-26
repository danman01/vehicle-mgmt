class AddReservedToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :reserved, :integer, :default=>0
  end

  def self.down
    remove_column :vehicles, :reserved
  end
end
