require 'spec_helper'

describe "albums/edit" do

  let(:stub_artist) { FactoryGirl.build_stubbed(:artist) }
  let(:test_album) do
    FactoryGirl.build_stubbed(:album,
      :title => "Title",
      :artist => stub_artist
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
      assign(:album, test_album)
    end

    it "renders the edit album form" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form[action=?][method=?]", album_path(test_album), "post" do
        assert_select "input#album_title[name=?]", "album[title]"
        assert_select "select#album_artist_id[name=?]", "album[artist_id]"
      end
    end

  end
end
