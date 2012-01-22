class SongsController < SongRakeController
  skip_before_filter :authenticate_user!, :only => [] #none, have to sign in for any action
  skip_before_filter :authenticate_admin, :only => [:create, :upvote, :downvote]

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

    if !PlaylistRole.playlist_member_or_creator?(@song.playlist_id, current_user)
      redirect_to playlist_path(@song.playlist_id), notice: 'Must join playlist before you can add a song'
      return
    end

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

  def upvote
    @song = Song.find(params[:id])

    if current_user == @song.requester
      redirect_to :back, notice: "You can't upvote your own song. Nice try though :)"
      return
    end

    if current_user.voted_for?(@song)
      redirect_to :back, notice: "You have already voted on this song"
      return
    end

    current_user.vote_for(@song)
    redirect_to :back, notice: "Thanks for your vote!"
  end

  def downvote
    @song = Song.find(params[:id])

    if current_user == @song.requester
      redirect_to :back, notice: "You can't downvote your own song. Why would you want to do that?"
      return
    end

    if current_user.voted_for?(@song) || current_user.voted_against?(@song)
      redirect_to :back, notice: "You have already voted on this song"
      return
    end

    current_user.vote_against(@song)
    redirect_to :back, notice: "Thanks for your vote!"
  end
end
