class Album < ActiveRecord::Base
  belongs_to :artist
  
  validates_presense_of :artist
end
