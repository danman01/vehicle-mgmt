class AddServiceCommentsToVehicle < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :service_comments, :text
    
  end

  def self.down
    remove_column :vehicles, :service_comments
    
  end
end
