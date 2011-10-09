class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :playlist_albums
  has_many :playlists, :through => :playlist_albums

  validates_presence_of :title
  validates_presence_of :artist
end
