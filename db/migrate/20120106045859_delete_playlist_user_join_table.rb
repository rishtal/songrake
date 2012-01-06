class DeletePlaylistUserJoinTable < ActiveRecord::Migration
  def up
    drop_table :playlists_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Can't rollback dropping players_users table"
  end
end
