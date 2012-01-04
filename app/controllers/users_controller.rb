class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @playlists = Playlist.find_all_by_creator_id(@user)

    respond_to do |format|
      format.html
      format.json {render json: @user}
    end
  end
end
