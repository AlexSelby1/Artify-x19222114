require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
•
test “name should be present” do
    user = User.new(username: " ")
    assert_not user.valid ?, "username is empty"
puts "username is present"
end
end
