require 'spec_helper'

describe "admin/rs_imports/index.html.erb" do
  before(:each) do
    assign(:admin_rs_imports, [
      stub_model(Admin::RsImport,
        :album => "Album",
        :artist => "Artist",
        :order => 1
      ),
      stub_model(Admin::RsImport,
        :album => "Album",
        :artist => "Artist",
        :order => 1
      )
    ])
  end

  it "renders a list of admin/rs_imports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Album".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Artist".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
