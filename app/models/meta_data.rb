class MetaData < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  attr_accessible :data, :source

  serialize :data, Hash

  def update_album!
    item.genre = data['primaryGenreName']
    item.album_art = data['artworkUrl100']
    item.save
  end
end
