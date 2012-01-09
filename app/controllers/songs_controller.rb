class SongsController < ApplicationController
  
  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
    @song = Song.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(params[:song])
    @song.requester = current_user

    respond_to do |format|
      if @song.save
        format.html { redirect_to playlist_path(@song.playlist_id), notice: 'Song was successfully created.' }
      else
        format.html { redirect_to playlist_path(params[:song][:playlist_id]), notice: 'Song has already been added.'}
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url }
    end
  end
end
