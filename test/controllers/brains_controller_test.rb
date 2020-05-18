require 'test_helper'

class BrainsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brains_index_url
    assert_response :success
  end

  test "should get new" do
    get brains_new_url
    assert_response :success
  end

  test "should get create" do
    get brains_create_url
    assert_response :success
  end

end
