require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
		get :index
		assert_response :success
		assert_select '#columns #side a', minimum: 4
		assert_select '#main .entry', 4
		assert_select 'h3', 'Programming Ruby 1.9'
		assert_select '.price', /Rs. [,\d]+\.\d\d/
  end

end
