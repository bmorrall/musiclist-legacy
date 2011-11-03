FactoryGirl.define do
  factory :artist do
    sequence :name do |n|
      "Artist #{n}"
    end
  end
end