class SetDefaultFulfilled2 < ActiveRecord::Migration
  def self.up
    change_column :reservations, :fulfilled, :integer, :default=>0
  end

  def self.down
  end
end
