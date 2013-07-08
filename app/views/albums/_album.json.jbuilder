json.id album.id
json.artist album.artist.name unless album.artist.nil?
json.title album.title
json.genre album.genre
json.year album.year
json.album_art album.album_art
if can?(:update, album)
  json.edit_link edit_album_path(album)
else
  json.edit_link { json.null! }
end
