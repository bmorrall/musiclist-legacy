require 'spec_helper'

describe "admin/rs_imports/show.html.erb" do
  before(:each) do
    @admin_rs_import = assign(:admin_rs_import, stub_model(Admin::RsImport,
      :album => "Album",
      :artist => "Artist",
      :order => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Album/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Artist/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
