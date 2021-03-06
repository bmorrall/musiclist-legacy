class AlbumsController < ApplicationController
  load_resource :album
  authorize_resource :album
  before_filter :load_artists, :only => [:new, :edit, :create, :update]

  # GET /albums
  # GET /albums.json
  def index
    # @albums = Album.all
    # @albums = @albums.page(params[:page] || 1)
    @albums = @albums.order(:title)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: { albums: @albums } }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    # @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: { album: @album } }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    # @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: { album: @album } }
    end
  end

  # GET /albums/1/edit
  def edit
    # @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create
    # @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        format.html { redirect_to album_path(@album), notice: 'Album was successfully created.' }
        format.json { render json: { album: @album }, status: :created, location: album_path(@album) }
      else
        format.html { render action: "new" }
        format.json { render json: { errors: @album.errors }, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    # @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to album_path(@album), notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: { errors: @album.errors }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    # @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  protected

  def load_artists
    @artists ||= Artist.order('sort_name ASC, name ASC')
  end

  # Capture any access violations, ensure User isn't unnessisarily redirected to root
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html do
        if params[:action] == 'index'
          redirect_to root_url, :alert => exception.message
        else
          redirect_to albums_url, :alert => exception.message
        end
      end
      format.json { head :forbidden }
    end
  end

end
