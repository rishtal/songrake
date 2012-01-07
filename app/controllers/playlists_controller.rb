class PlaylistsController < ApplicationController
  # GET /playlists
  # GET /playlists.json
  def index
    #only show listed playlist. Don't show unlisted playlists
    @playlists = Playlist.find_all_by_playlist_type("Listed")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playlists }
    end
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    @playlist = Playlist.find(params[:id])
    @song = Song.new

    creator_array = @playlist.roles.where(:role => "Creator")
    if creator_array.size == 1
      @creator = creator_array[0].user
    else
      @creator = nil
    end

    members_roles = @playlist.roles.where(:role => "Member")
    @members = Array.new
    members_roles.each { |r| @members << r.user }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @playlist }
    end
  end

  # GET /playlists/new
  # GET /playlists/new.json
  def new
    @playlist = Playlist.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @playlist }
    end
  end

  # GET /playlists/1/edit
  def edit
    @playlist = Playlist.find(params[:id])
  end

  # POST /playlists
  # POST /playlists.json
  def create

    error = true
    @playlist = Playlist.new(params[:playlist])
    if @playlist.save
      @role = @playlist.roles.build(:playlist_id => @playlist.id,
                                    :user_id => current_user.id,
                                    :role => "Creator")
      if @role.save
        error = false
      end
    end

    respond_to do |format|
      if !error
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
        format.json { render json: @playlist, status: :created, location: @playlist }
      else
        format.html { render action: "new" }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /playlists/1
  # PUT /playlists/1.json
  def update
    @playlist = Playlist.find(params[:id])

    respond_to do |format|
      if @playlist.update_attributes(params[:playlist])
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    respond_to do |format|
      format.html { redirect_to playlists_url }
      format.json { head :ok }
    end
  end

  def join
    @playlist = Playlist.find(params[:playlist_id])
    @role = Role.join_playlist_as_member(@playlist.id, current_user.id)
    respond_to do |format|
      if @role.save
        format.html { redirect_to playlist_path(@playlist.id), notice: "Successfully added to playlist"}
      else
        format. html { redirect_to playlist_path(@playlist.id), notice: "You are already a member of this playlist"}
      end
    end
  end
end
