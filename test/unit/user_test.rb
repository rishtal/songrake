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
end
