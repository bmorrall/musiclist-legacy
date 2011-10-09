class Playlist < ActiveRecord::Base
  has_many :playlist_albums
  has_many :albums, :through => :playlist_albums

  def to_param
    parameterized = name.gsub("'s", 's')
    parameterized = parameterized.parameterize
    "#{id}-#{parameterized}"
  end
end
