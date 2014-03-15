require 'spec_helper'

describe "sidebar_links/edit" do
  before(:each) do
    @sidebar_link = assign(:sidebar_link, stub_model(SidebarLink,
      :name => "MyString",
      :link_to => "MyString",
      :icon => "MyString"
    ))
  end

  it "renders the edit sidebar_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sidebar_link_path(@sidebar_link), "post" do
      assert_select "input#sidebar_link_name[name=?]", "sidebar_link[name]"
      assert_select "input#sidebar_link_link_to[name=?]", "sidebar_link[link_to]"
      assert_select "input#sidebar_link_icon[name=?]", "sidebar_link[icon]"
    end
  end
end
