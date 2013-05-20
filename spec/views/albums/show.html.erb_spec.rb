require 'spec_helper'

describe "albums/show" do

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

    it "renders attributes in a <dl> as a <dt> and <dd> pair" do
      render
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "dl>dt", :text => "Title:"
      assert_select "dl>dd", :text => "Title".to_s
    end

    context "with a artist reference" do
      before(:each) do
        test_album.artist = FactoryGirl.build_stubbed(:artist)
      end
      context 'without read Artist permissions' do
        it "should not a render link to artist" do
          render
          assert_select "dl>dt", :text => "Artist:", :count => 0
          assert_select "dl>dd>a[href=?]", artist_path(test_album.artist), :count => 0
        end
      end
      context 'with read Artist permissions' do
        before(:each) do
          @ability.can :read, Artist
        end
        it "renders a namespaced link to artist" do
          render
          assert_select "dl>dt", :text => "Artist:"
          assert_select "dl>dd>a[href=?]", artist_path(test_album.artist), :count => 1
        end
      end
    end
  end

end