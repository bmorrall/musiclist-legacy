class AlbumStatus < ActiveRecord::Base
  scope :played, where(:played => true)
  scope :purchased, where(:purchased => true)

  # album:references
  belongs_to :album
  attr_accessible :album_id
  validates_presence_of :album_id
  validates_uniqueness_of :album_id

  # played:boolean
  attr_accessible  :played

  # purchased:boolean
  attr_accessible  :purchased

end
