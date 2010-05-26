require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: users
#
#  myid       :string(40)      primary key
#  user_fname :string(50)
#  user_lname :string(50)
#  user_email :string(50)
#  user_group :string(25)
#  role       :text            default("normal")
#  logged_in  :integer         default(0)
#  password   :text
#

