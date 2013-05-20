require 'spec_helper'

describe "playlists/show" do

  let(:test_playlist) do
    FactoryGirl.build_stubbed(:playlist,
      :name => "Name"
    )
  end

  before(:each) do
    # Stub ability for testing
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    controller.stub(:current_ability) { @ability }
  end

  context do # Within default nesting
    before(:each) do
      # Add Properties for view scope
      assign(:playlist, test_playlist)

      playlist_albums = [FactoryGirl.create(:playlist_album)]
      assign(:playlist_albums, playlist_albums)

      album_statuses = []
      album_statuses.stub(:find_by_album_id).and_return(nil)
      assign(:album_statuses, album_statuses)
    end

    it "renders the name in a h2 block" do
      render
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "h2", :text => "Name".to_s
    end
  end

end