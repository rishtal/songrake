class FixColumnNameToSong < ActiveRecord::Migration
  def change
    rename_column :songs, :by, :artist
  end
end
