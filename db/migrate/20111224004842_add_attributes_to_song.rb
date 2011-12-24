class AddAttributesToSong < ActiveRecord::Migration
  def change
    add_column :songs, :upvotes, :integer
    add_column :songs, :downvotes, :integer
    add_column :songs, :playlist_id, :integer
    add_column :songs, :requester_id, :integer
  end
end
