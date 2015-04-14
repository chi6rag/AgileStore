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

  test "markup for store.coffee is in place" do
    get :index
    assert_select ".store .entry>img", 4
    assert_select ".entry input[type='submit']", 4
  end

end
