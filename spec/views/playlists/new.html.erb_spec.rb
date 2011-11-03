require 'spec_helper'

describe "playlists/new.html.erb" do
  before(:each) do
    assign(:playlist, stub_model(Playlist,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new playlist form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => playlists_path, :method => "post" do
      assert_select "input#playlist_name", :name => "playlist[name]"
    end
  end
end