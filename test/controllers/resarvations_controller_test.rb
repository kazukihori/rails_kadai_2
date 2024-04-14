require "test_helper"

class ResarvationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resarvations_index_url
    assert_response :success
  end
end
