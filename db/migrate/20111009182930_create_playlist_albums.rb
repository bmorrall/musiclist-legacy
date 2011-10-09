class CreatePlaylistAlbums < ActiveRecord::Migration
  def change
    create_table :playlist_albums do |t|
      t.integer :playlist_id
      t.integer :album_id
      t.integer :order, :default => 0
    end
  end
end
