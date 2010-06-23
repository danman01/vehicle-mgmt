class AddHowsMyDrivingToVehicle < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :hows_my_driving, :string
  end

  def self.down
    remove_column :vehicles, :hows_my_driving
  end
end
