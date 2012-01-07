module UsersHelper
  def show_created_playlists
    @created_playlists.size > 0
  end

  def show_joined_playlists
    @joined_playlists.size > 0
  end
end
