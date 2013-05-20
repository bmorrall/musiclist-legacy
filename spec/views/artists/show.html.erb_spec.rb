require 'spec_helper'

describe "artists/show" do

  let(:test_artist) do
    FactoryGirl.build_stubbed(:artist,
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

    it "renders attributes in a <dl> as a <dt> and <dd> pair" do
      render
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "dl>dt", :text => "Name:"
      assert_select "dl>dd", :text => "Name".to_s
    end
  end

end