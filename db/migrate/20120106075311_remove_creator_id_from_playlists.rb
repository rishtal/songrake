class RemoveCreatorIdFromPlaylists < ActiveRecord::Migration
  def up
    remove_column :playlists, :creator_id
  end

  def down
    add_column :playlists, :creator_id, :integer
  end
end
