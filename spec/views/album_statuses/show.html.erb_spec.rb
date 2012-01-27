require 'spec_helper'

describe "album_statuses/show.html.erb" do
  before(:each) do
    @album_status = assign(:album_status, stub_model(AlbumStatus,
      :album_id => 1,
      :played => false,
      :purchased => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
