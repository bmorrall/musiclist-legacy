ActiveAdmin.register Album do
  index do
    column :id
    column :title
    column :artist do |album|
      album.artist.name unless album.artist.nil?
    end
    column :created_at
    column :updated_at
    default_actions
  end
end
