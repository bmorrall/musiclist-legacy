class AlbumStatusesController < InheritedResources::Base# GET /albums
  before_filter :authenticate

  # GET /albums.json
  def index
    @album_statuses = AlbumStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @albums }
    end
  end
  
  # POST /albums
   # POST /albums.json
   def create
     @album_status = AlbumStatus.find_or_create_by_album_id(params[:album_status][:album_id])
     @album_status.attributes = params[:album_status]

     puts @album_status.attributes

     respond_to do |format|
       if @album_status.save
         format.html { redirect_to @album_status, notice: 'Album was successfully created.' }
         format.json { render json: @album_status, status: :created, location: @album }
         format.js   { render :action => :show }
       else
         format.html { render action: "new" }
         format.json { render json: @album_status.errors, status: :unprocessable_entity }
         format.js   { render json: @album_status.errors, status: :unprocessable_entity }
       end
     end
   end

   protected

   def authenticate
     authenticate_or_request_with_http_basic do |username, password|
       username == "foo" && password == "bar"
     end
   end
end
