require 'spec_helper'

describe "album_statuses/index.html.erb" do
  before(:each) do
    assign(:album_statuses, [
      stub_model(AlbumStatus,
        :album_id => 1,
        :played => false,
        :purchased => false
      ),
      stub_model(AlbumStatus,
        :album_id => 1,
        :played => false,
        :purchased => false
      )
    ])
  end

  it "renders a list of album_statuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
