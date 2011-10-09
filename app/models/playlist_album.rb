class PlaylistAlbum < ActiveRecord::Base
  belongs_to :album
  belongs_to :playlist
end
