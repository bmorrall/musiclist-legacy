require 'spec_helper'

describe Artist do

  # name:string
  it { should allow_mass_assignment_of(:name) }
  it { should validate_presence_of(:name) }

  describe '#display_name' do
    it 'displays "Rolling Stones" as "Rolling Stones"' do
      artist = FactoryGirl.build(:artist, :name => 'Rolling Stones')
      artist.display_name.should == 'Rolling Stones'
    end
    it 'displays "Beatles, The" as "The Beatles"' do
      artist = FactoryGirl.build(:artist, :name => 'Beatles, The')
      artist.display_name.should == 'The Beatles'
    end
    it 'displays "Springsteen, Bruce" as "Bruce Springsteen"' do
      artist = FactoryGirl.build(:artist, :name => 'Springsteen, Bruce')
      artist.display_name.should == 'Bruce Springsteen'
    end
    it 'displays "Pop, Iggy & Stooges" as "Iggy Pop & Stooges"' do
      artist = FactoryGirl.build(:artist, :name => 'Pop, Iggy & Stooges')
      artist.display_name.should == 'Iggy Pop & Stooges'
    end
  end
end
