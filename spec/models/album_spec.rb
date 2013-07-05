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


end
