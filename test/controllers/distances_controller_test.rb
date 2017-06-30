require 'test_helper'

class DistancesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get distances_new_url
    assert_response :success
  end

  test "should get create" do
    get distances_create_url
    assert_response :success
  end

end
