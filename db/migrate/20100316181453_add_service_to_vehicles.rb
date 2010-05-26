class AddServiceToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :needs_gas, :integer, :default =>0
    add_column :vehicles, :needs_service, :integer, :default=>0
  end

  def self.down
    remove_column :vehicles, :needs_gas
    remove_column :vehicles, :needs_service
  end
end
