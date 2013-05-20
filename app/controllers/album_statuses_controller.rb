class AlbumStatusesController < ApplicationController
  authorize_resource :album_status

  def create
    authorize! :create, AlbumStatus

    @album_status = AlbumStatus.find_or_create_by_album_id(params[:album_status][:album_id])
    @album_status.attributes = params[:album_status]

    respond_to do |format|
      if @album_status.save
        format.html { redirect_to @album_status, notice: 'Album was successfully created.' }
        format.json { render json: @album_status, status: :created, location: @album }
      else
        format.html { redirect_to root_url, alert: 'Unable to update Album Status' }
        format.json { render json: @album_status.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  # Capture any access violations, ensure User isn't unnessisarily redirected to root
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { throw exception }
      format.json { head :no_content, :status => :forbidden }
    end
  end

end
