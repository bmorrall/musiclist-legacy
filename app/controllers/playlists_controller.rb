class PlaylistsController < InheritedResources::Base
  def show
    @playlist = Playlist.find(params[:id])
    @playlist_albums = @playlist.albums
  end
end
