class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_playlists = Playlist.find_all_by_creator_id(@user)
    @other_playlists = @user.joined_playlists

    respond_to do |format|
      format.html
      format.json {render json: @user}
    end
  end
end
