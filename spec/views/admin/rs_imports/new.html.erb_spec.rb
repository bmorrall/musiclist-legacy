require 'spec_helper'

describe "admin/rs_imports/new.html.erb" do
  before(:each) do
    assign(:admin_rs_import, stub_model(Admin::RsImport,
      :album => "MyString",
      :artist => "MyString",
      :order => 1
    ).as_new_record)
  end

  it "renders new admin_rs_import form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_rs_imports_path, :method => "post" do
      assert_select "input#admin_rs_import_album", :name => "admin_rs_import[album]"
      assert_select "input#admin_rs_import_artist", :name => "admin_rs_import[artist]"
      assert_select "input#admin_rs_import_order", :name => "admin_rs_import[order]"
    end
  end
end
