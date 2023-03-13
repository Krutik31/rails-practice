require "test_helper"

class FacultiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get faculties_index_url
    assert_response :success
  end
end
