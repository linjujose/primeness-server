require 'test_helper'

class UserEntryTest < ActiveSupport::TestCase

    def setup
        @user_entry = UserEntry.new(user_number: 29, created_at: Time.now)
    end

    test "user entry should be valid" do
        assert @user_entry.valid?
    end

    test "user entry should be valid without giving time" do
        @user_entry.created_at = nil
        assert @user_entry.valid?
    end

    test "user entry should be present" do
        @user_entry.user_number = nil
        assert_not @user_entry.valid?
    end

    test "user entry should be a valid number" do
        @user_entry.user_number = "hi"
        assert_not @user_entry.valid?
    end

    test "user entry should be a valid integer" do
        @user_entry.user_number = 4.5
        assert_not @user_entry.valid?
    end
end