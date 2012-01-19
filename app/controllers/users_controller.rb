class UsersController < SongRakeController
  skip_before_filter :authenticate_user!, :only => [] #none, have to sign in for any action
  skip_before_filter :authenticate_admin, :only => [:show]
  
  def show
    @user = User.find(params[:id])
    @playlists = @user.playlists

    respond_to do |format|
      format.html
    end
  end
end
