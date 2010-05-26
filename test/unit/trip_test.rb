require 'test_helper'

class TripTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: trips
#
#  trip_id          :integer         not null, primary key
#  vehicle_id       :string(16)
#  destination_name :string(100)
#  myid             :string(40)
#  check_out_time   :datetime
#  check_in_time    :datetime
#  comments         :string(255)
#  reservation_id   :integer
#

