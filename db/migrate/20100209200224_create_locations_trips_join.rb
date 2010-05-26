class CreateLocationsTripsJoin < ActiveRecord::Migration
  def self.up
    create_table 'locations_trips', :id => false do |t|
      t.column 'building_dbid', :integer
      t.column 'trip_id', :integer
    end
  end

  def self.down
    drop_table 'locations_trips'
  end
end
