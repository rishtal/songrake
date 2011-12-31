class AddIndexToSongs < ActiveRecord::Migration
  def change
    add_index :songs,
              [:title, :artist, :playlist_id],
              :name => "index_unique_song_in_playlist",
              :unique => true
  end
end
