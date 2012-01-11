class UsersController < SongRakeController
  skip_before_filter :authenticate_user!, :only => [] #none, have to sign in for any action
  skip_before_filter :authenticate_admin, :only => [:show]
  
  def show
    @user = User.find(params[:id])

    @creator_roles = @user.playlist_roles.where(:role => "Creator")
    @created_playlists = Array.new
    @creator_roles.each { |r| @created_playlists << r.playlist }

    @member_roles = @user.playlist_roles.where(:role => "Member")
    @joined_playlists = Array.new
    @member_roles.each { |r| @joined_playlists << r.playlist }

    respond_to do |format|
      format.html
    end
  end
end
