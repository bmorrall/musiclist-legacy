class PlaylistsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  load_resource :playlist
  authorize_resource :playlist

  # GET /playlists
  # GET /playlists.json
  def index
    # @playlists = Playlist.all
    # @playlists = @playlists.page(params[:page] || 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: { playlists: @playlists } }
    end
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    # @playlist = Playlist.find(params[:id])
    @playlist_albums = @playlist.playlist_albums.includes(:album => [:artist])
    @album_statuses = AlbumStatus.scoped

    case params[:order]
    when 'album'
      @playlist_albums = @playlist_albums.joins(:album).order('albums.title, position asc')
    when 'artist'
      @playlist_albums = @playlist_albums.joins(:album => [:artist]).order('artists.sort_name asc, artists.name asc, position asc')
    else
      @playlist_albums = @playlist_albums.order(:position)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: { playlist: @playlist } }
    end
  end

  # GET /playlists/new
  # GET /playlists/new.json
  def new
    # @playlist = Playlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: { playlist: @playlist } }
    end
  end

  # GET /playlists/1/edit
  def edit
    # @playlist = Playlist.find(params[:id])
  end

  # POST /playlists
  # POST /playlists.json
  def create
    # @playlist = Playlist.new(params[:playlist])

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to playlist_path(@playlist), notice: 'Playlist was successfully created.' }
        format.json { render json: { playlist: @playlist }, status: :created, location: playlist_path(@playlist) }
      else
        format.html { render action: "new" }
        format.json { render json: { errors: @playlist.errors }, status: :unprocessable_entity }
      end
    end
  end

  # PUT /playlists/1
  # PUT /playlists/1.json
  def update
    # @playlist = Playlist.find(params[:id])

    respond_to do |format|
      if @playlist.update_attributes(params[:playlist])
        format.html { redirect_to playlist_path(@playlist), notice: 'Playlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: { errors: @playlist.errors }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    # @playlist = Playlist.find(params[:id])
    @playlist.destroy

    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  protected

  # Capture any access violations, ensure User isn't unnessisarily redirected to root
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html do
        if params[:action] == 'index'
          redirect_to root_url, :alert => exception.message
        else
          redirect_to playlists_url, :alert => exception.message
        end
      end
      format.json { head :no_content, :status => :forbidden }
    end
  end

end
