require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "valid role" do
    valid_role = FactoryGirl.build(:playlist_role)
    assert valid_role.valid?
  end

  test "invalid role" do
    invalid_role = FactoryGirl.build(:playlist_role, :role => "invalidRole")
    assert invalid_role.invalid?
    assert_equal I18n.t("activerecord.errors.messages.inclusion"), invalid_role.errors[:role].join('; ')
  end

  test "uniqueness of role" do
    valid_role = FactoryGirl.create(:playlist_role)
    duplicate_role = PlaylistRole.new(:playlist_id => valid_role.playlist_id, :user_id => valid_role.user_id, :role => "Creator")
    assert duplicate_role.invalid?
    assert_equal I18n.t("errors.messages.duplicate_role"), duplicate_role.errors[:user_id].join('; ')
  end

end
