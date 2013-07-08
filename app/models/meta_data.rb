class MetaData < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  attr_accessible :data, :source

  serialize :data, Hash

  # Album.where(:genre => nil).each { |a| a.meta_datas.first.update_album! unless a.meta_datas.empty? }
  def update_album!
    item.genre = data['primaryGenreName']
    item.album_art = data['artworkUrl100']
    item.save
  end
end
