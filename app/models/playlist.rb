class Playlist < ActiveRecord::Base
  has_many :playlist_albums, :dependent => :destroy
  has_many :albums, :through => :playlist_albums

  # name:string
  attr_accessible :name
  validates_presence_of :name

  def to_param
    parameterized = name.gsub("'s", 's')
    parameterized = parameterized.parameterize
    "#{id}-#{parameterized}"
  end
end
