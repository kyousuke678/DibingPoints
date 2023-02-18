require "test_helper"

class Customers::RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get followings" do
    get customers_relationships_followings_url
    assert_response :success
  end

  test "should get followers" do
    get customers_relationships_followers_url
    assert_response :success
  end
end
