class AlbumStatus < ActiveRecord::Base
  belongs_to :album

  attr_accessible :album_id, :played, :purchased

  validates_presence_of :album_id
  validates_uniqueness_of :album_id
end
