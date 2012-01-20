module PlaylistsHelper

  def playlist_member_or_creator?(playlist)
    PlaylistRole.playlist_member_or_creator?(playlist.id, current_user)
  end
end
