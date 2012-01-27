require 'spec_helper'

describe "album_statuses/new.html.erb" do
  before(:each) do
    assign(:album_status, stub_model(AlbumStatus,
      :album_id => 1,
      :played => false,
      :purchased => false
    ).as_new_record)
  end

  it "renders new album_status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => album_statuses_path, :method => "post" do
      assert_select "input#album_status_album_id", :name => "album_status[album_id]"
      assert_select "input#album_status_played", :name => "album_status[played]"
      assert_select "input#album_status_purchased", :name => "album_status[purchased]"
    end
  end
end
