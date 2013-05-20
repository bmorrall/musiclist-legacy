class Album < ActiveRecord::Base
  has_many :playlist_albums, :dependent => :destroy
  has_many :playlists, :through => :playlist_albums

  # title:string
  attr_accessible :title
  validates_presence_of :title

  # artist:references
  belongs_to :artist
  attr_accessible :artist_id
  validates_presence_of :artist_id

  def to_s
    "#{artist.name}: #{title}"
  end

end
