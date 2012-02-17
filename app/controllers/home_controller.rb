class HomeController < SongRakeController
  skip_before_filter :authenticate_user!, :only => [:index, :about]
  skip_before_filter :authenticate_admin, :only => [:index, :about]

  def index
    @playlists = Playlist.where(:playlist_type => "Listed").order('member_count DESC').limit(5)
  end

  def about
  end
end
