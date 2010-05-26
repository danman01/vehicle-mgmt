require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: vehicles
#
#  vehicleID   :string(10)      primary key
#  year_made   :integer
#  make        :string(14)
#  model       :string(20)
#  owner       :string(20)
#  alias       :string(255)
#  image_url   :string(255)
#  checked_out :integer         default(0)
#  reserved    :integer         default(0)
#

