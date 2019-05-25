require 'test_helper'

class PromoteActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get promote_activities_index_url
    assert_response :success
  end

end
