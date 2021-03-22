require 'test_helper'

class UserEntriesTest < ActionDispatch::IntegrationTest
  
  def setup
    @user_entry = UserEntry.new(user_number: 29)
    @user_entry.save
  end

  test "should get new user entry form page" do
    get user_entries_path
    assert_response :success
  end

  test "should reject invalid user number entries" do
    get user_entries_path
    assert_template 'user_entries/new'
    # Check for no database update
    assert_no_difference 'UserEntry.count' do
      post user_entries_path, params: { user_entry: { user_number: 29.5, }}
    end
  end

  test "should update db for valid entry" do
    get user_entries_path
    assert_template 'user_entries/new'

    assert_difference 'UserEntry.count', 1 do
      post user_entries_path, params: { user_entry: { user_number: 29, }}
    end
  end

  test "should check for success code after check redirect" do
    get user_entries_path
    assert_template 'user_entries/new'
    post user_entries_path, params: { user_entry: { user_number: 29, }}
    follow_redirect!
    assert_match 200.to_s, response.code
  end

  test "should take valid user entry" do
    get user_entries_path
    assert_template 'user_entries/new'
    post user_entries_path, params: { user_entry: { user_number: 29, }}
    follow_redirect!
    assert_match "#{@user_entry.user_number} is a prime number.", response.body
  end

  test "should display not prime if not" do
    @user_entry.user_number = 75
    get user_entries_path
    assert_template 'user_entries/new'
    post user_entries_path, params: { user_entry: { user_number: @user_entry.user_number, }}
    follow_redirect!
    assert_match "#{@user_entry.user_number} is not a prime number.", response.body
  end
end
