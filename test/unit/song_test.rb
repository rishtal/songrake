require 'test_helper'

class SongTest < ActiveSupport::TestCase
  test "valid song" do
    valid_song = FactoryGirl.create(:song)
    assert valid_song.valid?
  end

  test "song already added to playlist" do
    valid_song = FactoryGirl.create(:song)
    duplicate_song = Song.new(:title => valid_song.title,
                              :artist => valid_song.artist,
                              :requester_id => valid_song.requester_id,
                              :playlist_id => valid_song.playlist_id)
    assert duplicate_song.invalid?
    assert_equal I18n.t("errors.messages.duplicate_song"), duplicate_song.errors[:title].join('; ')
  end
end
