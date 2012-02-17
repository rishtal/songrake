require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "create valid user" do
    valid_user = FactoryGirl.create(:user)
    assert valid_user.valid?
  end

  test "email already taken" do
    valid_user_attr = FactoryGirl.attributes_for(:user)
    User.create(valid_user_attr)

    same_user = User.new(valid_user_attr)
    assert same_user.invalid?
    assert_equal I18n.t('activerecord.errors.messages.taken'), same_user.errors[:email].join('; ')
  end

  test "username too short" do
    short_name_user = FactoryGirl.build(:user, :username => "u")
    assert short_name_user.invalid?
    assert_equal I18n.t('activerecord.errors.messages.too_short', :count => 3), short_name_user.errors[:username].join('; ')
  end

  test "username too long" do
    long_name_user = FactoryGirl.build(:user, :username => "username9012345678901")
    assert long_name_user.invalid?
    assert_equal I18n.t('activerecord.errors.messages.too_long', :count => 20), long_name_user.errors[:username].join('; ')
  end
end
