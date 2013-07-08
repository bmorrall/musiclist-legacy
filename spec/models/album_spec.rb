require 'spec_helper'

describe Album do

  # title:string
  it { should allow_mass_assignment_of(:title) }
  it { should validate_presence_of(:title) }

  # artist:references
  it { should allow_mass_assignment_of(:artist_id) }
  it { should belong_to(:artist) }
  it { should validate_presence_of(:artist_id) }

  # genre:string
  it { should allow_mass_assignment_of(:genre) }

  # album_art:string
  it { should allow_mass_assignment_of(:album_art) }

  # year:string
  it { should allow_mass_assignment_of(:year) }


  describe '#extract_editions' do
    it 'converts the album title' do
      album = FactoryGirl.create(:album, :title => 'Ultimate Collection (Bonus Cd) (W/Bonus) (Bonus Tracks) (Hybr) (Rmst) (Dlx) (Dig)')
      puts album.title
      album.extract_editions
      album.save!

      album.reload
      album.editions.should include('Bonus Tracks')
      album.editions.should include('Rmst')
      album.editions.should include('Dlx')
      album.editions.should include('Dig')
      album.title.should eq('Ultimate Collection')
    end
  end

end
