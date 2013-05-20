require 'spec_helper'

describe "playlists/new" do

  let(:test_playlist) do
    FactoryGirl.build(:playlist,
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
    end

    it "renders new playlist form" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form[action=?][method=?]", playlists_path, "post" do
        assert_select "input#playlist_name[name=?]", "playlist[name]"
      end
    end
  end
end