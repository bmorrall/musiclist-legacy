class PlaylistsController < ApplicationController
  def show
    @playlist = Playlist.find(params[:id])
    @playlist_albums = @playlist.playlist_albums.includes(:album => [:artist])
    @album_statuses = AlbumStatus.scoped

    case params[:order]
    when 'album'
      @playlist_albums = @playlist_albums.joins(:album).order('albums.title, position asc')
    when 'artist'
      @playlist_albums = @playlist_albums.joins(:album => [:artist]).order('artists.name asc, position asc')
    else
      @playlist_albums = @playlist_albums.order(:position)
    end
  end
end
