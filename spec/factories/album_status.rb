# This will generate the AlbumStatus class
FactoryGirl.define do

  factory :album_status do
    played true
    purchased true
    album
  end

end
