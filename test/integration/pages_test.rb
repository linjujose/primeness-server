require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  
  test "should get home page" do
    get root_path
    assert_response :success
  end

  test "should get help page" do
    get help_path
    assert_response :success
  end

  test "should get result page" do
    get result_path
    assert_response :success
  end

end
