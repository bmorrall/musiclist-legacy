# This will generate the Playlist class
FactoryGirl.define do

  factory :playlist do
    name { Faker::Company.name }
  end

end
