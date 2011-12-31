require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase

  test "valid playlist" do
    valid_playlist = FactoryGirl.build(:playlist)
    assert valid_playlist.valid?
  end

  test "playlist title can't be empty'" do
    short_title_playlist = FactoryGirl.build(:playlist, :name => "")
    assert short_title_playlist.invalid?
    assert_equal I18n.t('activerecord.errors.messages.blank'), short_title_playlist.errors[:name].join('; ')
  end
end
