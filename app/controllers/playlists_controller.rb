class PlaylistsController < SongRakeController
  skip_before_filter :authenticate_user!, :only => [:index, :show, :latest, :most_popular]
  skip_before_filter :authenticate_admin, :only => [:index, :show, :latest, :most_popular, :new, :create, :join]

  # GET /playlists
  # GET /playlists.json
  def index
    #only show listed playlist. Don't show unlisted playlists
    @playlists = Playlist.where(:playlist_type => "Listed").order('member_count DESC').paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    @playlist = Playlist.find(params[:id])
    @song = Song.new
    @creator = @playlist.creator
    
    @songs = @playlist.songs

    members_roles = @playlist.playlist_roles.where(:role => "Member")
    @members = Array.new
    members_roles.each { |r| @members << r.user }

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /playlists/new
  # GET /playlists/new.json
  def new
    @playlist = Playlist.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /playlists/1/edit
  def edit
    @playlist = Playlist.find(params[:id])
  end

  # POST /playlists
  # POST /playlists.json
  def create

    @playlist = Playlist.new

    error = false
    begin
      @playlist.create_playlist!(params[:playlist], current_user)
    rescue ActiveRecord::RecordInvalid
      error = true
    end

    respond_to do |format|
      if !error
        format.html { redirect_to @playlist, :flash => { :success => 'Playlist was successfully created.' }}
      else
        format.html { render action: "new" }
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
      else
        format.html { render action: "edit" }
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
    end
  end

  # Join a playlist as a member
  # POST /playlists/join/1
  def join
    @playlist = Playlist.find(params[:playlist_id])
    @role = PlaylistRole.join_playlist_as_member(@playlist.id, current_user.id)
    respond_to do |format|
      if @role.save
        format.html { redirect_to playlist_path(@playlist.id), notice: "Successfully joined playlist"}
      else
        format. html { redirect_to playlist_path(@playlist.id), :flash => { :error => "You are already a member of this playlist" }}
      end
    end
  end

  # Same as Playlist#Index, but list playlist most recently created first instead
  # of most popular
  # GET /playlists/latest
  def latest
    @playlists = Playlist.where(:playlist_type => "Listed").order('created_at DESC').paginate(:page => params[:page])

    render 'index'
  end

  # Same as Playlist#show, but list songs by most popular instead of most
  # recently created
  # GET /playlists/1/most_popular
  def most_popular
    @playlist = Playlist.find(params[:id])
    @song = Song.new
    @creator = @playlist.creator

    @songs = @playlist.songs.sort_by {|song| song.plusminus }.reverse

    members_roles = @playlist.playlist_roles.where(:role => "Member")
    @members = Array.new
    members_roles.each { |r| @members << r.user }

    render 'show'
  end

end
