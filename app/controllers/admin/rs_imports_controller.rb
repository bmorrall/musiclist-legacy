class Admin::RsImportsController < ApplicationController
  # GET /admin/rs_imports
  # GET /admin/rs_imports.json
  def show
    @admin_rs_import = Admin::RsImport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_rs_import }
    end
  end

  # PUT /admin/rs_imports
  # PUT /admin/rs_imports.json
  def create
    @admin_rs_import = Admin::RsImport.new(params[:admin_rs_import])

    if @admin_rs_import.valid?
      @album = @admin_rs_import.create_album!

      respond_to do |format|
        format.html { redirect_to admin_rs_imports_path, notice: 'Album was successfully created.' }
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
