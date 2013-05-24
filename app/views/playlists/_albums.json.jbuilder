
json.albums @playlist_albums do |playlist_album|
  json.partial! 'albums/album.json.jbuilder', album: playlist_album.album

  json.position playlist_album.position

  album_status = @album_statuses.find_by_album_id(playlist_album.album_id)
  json.played album_status.present? ? album_status.played? : false
  json.purchased album_status.present? ? album_status.purchased? : false
end
