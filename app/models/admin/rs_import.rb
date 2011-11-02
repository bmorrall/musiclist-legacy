require 'formtastic_faux_model'

class Admin::RsImport < FormtasticFauxModel
  PLAYLIST_NAME = 'Rolling Stone 500 Greatest Albums of all Time'
  attr_accessor :album, :artist, :position

  validates_presence_of :album
  validates_presence_of :artist
  validates_presence_of :position
  validates :position, :numericality => { :only_integer => true }

  def self.create_playlist
    Playlist.find_or_create_by_name(PLAYLIST_NAME)
  end

  def clean_artist
    artist.downcase.gsub(/\b\w/){$&.upcase}
  end

  def clean_album
    album.downcase.gsub(/\b\w/){$&.upcase}
  end

  def create_album!
    playlist = Admin::RsImport.create_playlist
    artist = Artist.find_or_create_by_name(clean_artist)
    album = Album.create! :title => clean_album, :artist => artist
    PlaylistAlbum.create! :playlist => playlist, :album => album, :position => position
    album
  end

  self.types = {
    :album => :string,
    :artist => :string,
    :position => :integer
  }
end