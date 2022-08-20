require 'test_helper'

class CourtsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get courts_new_url
    assert_response :success
  end

end
