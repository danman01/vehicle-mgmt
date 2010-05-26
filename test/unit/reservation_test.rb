require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: reservations
#
#  id             :integer         not null, primary key
#  fulfilled      :integer         default(0)
#  trip_id        :integer
#  vehicle_id     :integer         not null
#  user_id        :string(255)
#  reserved_from  :datetime
#  reserved_until :datetime
#  comments       :text
#  created_at     :datetime
#  updated_at     :datetime
#

