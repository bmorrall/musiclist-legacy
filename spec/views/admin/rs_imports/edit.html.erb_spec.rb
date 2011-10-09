require 'spec_helper'

describe "admin/rs_imports/edit.html.erb" do
  before(:each) do
    @admin_rs_import = assign(:admin_rs_import, stub_model(Admin::RsImport,
      :album => "MyString",
      :artist => "MyString",
      :order => 1
    ))
  end

  it "renders the edit admin_rs_import form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_rs_imports_path(@admin_rs_import), :method => "post" do
      assert_select "input#admin_rs_import_album", :name => "admin_rs_import[album]"
      assert_select "input#admin_rs_import_artist", :name => "admin_rs_import[artist]"
      assert_select "input#admin_rs_import_order", :name => "admin_rs_import[order]"
    end
  end
end
