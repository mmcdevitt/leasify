require 'spec_helper'

describe "sidebar_links/new" do
  before(:each) do
    assign(:sidebar_link, stub_model(SidebarLink,
      :name => "MyString",
      :link_to => "MyString",
      :icon => "MyString"
    ).as_new_record)
  end

  it "renders new sidebar_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sidebar_links_path, "post" do
      assert_select "input#sidebar_link_name[name=?]", "sidebar_link[name]"
      assert_select "input#sidebar_link_link_to[name=?]", "sidebar_link[link_to]"
      assert_select "input#sidebar_link_icon[name=?]", "sidebar_link[icon]"
    end
  end
end
