class Playlist < ActiveRecord::Base
  has_many :playlist_albums
  has_many :albums, :through => :playlist_albums
end
