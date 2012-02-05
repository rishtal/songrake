class AddSongCountToPlaylists < ActiveRecord::Migration
  def up
    add_column :playlists, :song_count, :integer, :default => 0

    Playlist.all.each do |p|
      p.song_count = p.songs.length
      p.save
    end

  end

  def down
    remove_column :playlists, :song_count
  end
end
