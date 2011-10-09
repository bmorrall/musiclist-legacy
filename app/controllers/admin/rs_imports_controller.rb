class Admin::RsImportsController < ApplicationController
  before_filter :authenticate_admin_user!

  # GET /admin/rs_imports
  # GET /admin/rs_imports.json
  def show
    @playlist = Admin::RsImport.create_playlist
    order = (@playlist.playlist_albums.maximum(:order) || 0) + 1
    @admin_rs_import = Admin::RsImport.new(:order => order)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_rs_import }
    end
  end

  # PUT /admin/rs_imports
  # PUT /admin/rs_imports.json
  def create
    @playlist = Admin::RsImport.create_playlist
    @admin_rs_import = Admin::RsImport.new(params[:admin_rs_import])

    if @admin_rs_import.valid?
      @album = @admin_rs_import.create_album!

      respond_to do |format|
        format.html { redirect_to admin_rs_imports_path, notice: "Album '#{@album.artist.name} - #{@album.title}' was successfully created." }
        format.json { render :json => @album, :status => :created, :location => @album }
      end
    else
      respond_to do |format|
        format.html { render :action => "show" }
        format.json { render :json => @admin_rs_import.errors, :status => :unprocessable_entity }
      end
    end
  end
end
