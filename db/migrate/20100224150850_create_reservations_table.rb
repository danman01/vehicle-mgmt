class CreateReservationsTable < ActiveRecord::Migration
  def self.up
     create_table :reservations do |t|
        t.integer :fulfilled, {:default=>0}
        t.integer :trip_id
        t.integer  :vehicle_id, :null => false
        t.string :user_id
        t.datetime :reserved_from
        t.datetime :reserved_until
        t.text  :comments
        t.timestamps
      end
  end

  def self.down
    drop_table :reservations
  end
end
