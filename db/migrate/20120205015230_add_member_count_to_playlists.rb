class AddMemberCountToPlaylists < ActiveRecord::Migration
  def up
    add_column :playlists, :member_count, :integer

    Playlist.all.each do |p|
      p.member_count = p.playlist_roles.length
      p.save
    end
    
  end

  def down
    remove_column :playlists, :member_count
  end
end
