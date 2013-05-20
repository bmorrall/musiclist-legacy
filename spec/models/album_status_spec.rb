require 'spec_helper'

describe AlbumStatus do

  # album:references
  it { should belong_to(:album) }
  it { should allow_mass_assignment_of(:album_id) }
  it { should validate_presence_of(:album_id) }

  # played:boolean
  it { should allow_mass_assignment_of(:played) }

  # purchased:boolean
  it { should allow_mass_assignment_of(:purchased) }

end
