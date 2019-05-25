require 'test_helper'

class UserActivitiesControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers
  # test "should get edit" do
  #   get user_activities_edit_url
  #   assert_response :success
  # end

  # test "player should not delete others players activities" do
  # 	current_user = users(:one)
  # 	sign_in(current_user)
  # 	assert_difference('UserActivity.count', -1) do
  # 		delete destroy_activity_path(current_user, activities(:one))
  # 	end

  # end

end
