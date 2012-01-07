class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @creator_roles = @user.roles.where(:role => "Creator")
    @created_playlists = Array.new
    @creator_roles.each { |r| @created_playlists << r.playlist }

    @member_roles = @user.roles.where(:role => "Member")
    @joined_playlists = Array.new
    @member_roles.each { |r| @joined_playlists << r.playlist }

    respond_to do |format|
      format.html
      format.json {render json: @user}
    end
  end


end
