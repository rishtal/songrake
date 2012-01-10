class RenameRolesTableToPlaylistRoles < ActiveRecord::Migration
  def change
    rename_table :roles, :playlist_roles
  end
end
