require 'spec_helper'

describe "artists/new" do

  let(:test_artist) do
    FactoryGirl.build(:artist,
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
      assign(:artist, test_artist)
    end

    it "renders new artist form" do
      render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form[action=?][method=?]", artists_path, "post" do
        assert_select "input#artist_name[name=?]", "artist[name]"
      end
    end
  end
end