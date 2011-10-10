class PlaylistsController < InheritedResources::Base
  def show
    @playlist = Playlist.find(params[:id])
    @playlist_albums = @playlist.playlist_albums.includes(:album => [:artist])
    case params[:order]
    when 'album'
      @playlist_albums = @playlist_albums.joins(:album).order('albums.title')
    when 'artist'
      @playlist_albums = @playlist_albums.joins(:album => [:artist]).order('artists.name')
    else
      @playlist_albums = @playlist_albums.order('`playlist_albums`.`order`')
    end
  end
end
