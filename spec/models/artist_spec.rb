require 'spec_helper'

describe Artist do
  describe '#display_name' do
    it 'displays "Rolling Stones" as "Rolling Stones"' do
      artist = Factory.build(:artist, :name => 'Rolling Stones')
      artist.display_name.should == 'Rolling Stones'
    end
    it 'displays "Beatles, The" as "The Beatles"' do
      artist = Factory.build(:artist, :name => 'Beatles, The')
      artist.display_name.should == 'The Beatles'
    end
    it 'displays "Springsteen, Bruce" as "Bruce Springsteen"' do
      artist = Factory.build(:artist, :name => 'Springsteen, Bruce')
      artist.display_name.should == 'Bruce Springsteen'
    end
    it 'displays "Pop, Iggy & Stooges" as "Iggy Pop & Stooges"' do
      artist = Factory.build(:artist, :name => 'Pop, Iggy & Stooges')
      artist.display_name.should == 'Iggy Pop & Stooges'
    end
  end
end
