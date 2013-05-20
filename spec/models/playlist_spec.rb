require 'spec_helper'

describe Playlist do

  # name:string
  it { should allow_mass_assignment_of(:name) }
  it { should validate_presence_of(:name) }

end
