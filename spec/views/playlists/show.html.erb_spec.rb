require 'spec_helper'

describe "playlists/show.html.erb" do
  before(:each) do
    @playlist = assign(:playlist, stub_model(Playlist,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
