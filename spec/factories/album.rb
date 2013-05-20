# This will generate the Album class
FactoryGirl.define do

  factory :album do
    title { Faker::Company.name }
    artist
  end

end
