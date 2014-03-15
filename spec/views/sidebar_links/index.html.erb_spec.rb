require 'spec_helper'

describe "sidebar_links/index" do
  before(:each) do
    assign(:sidebar_links, [
      stub_model(SidebarLink,
        :name => "Name",
        :link_to => "Link To",
        :icon => "Icon"
      ),
      stub_model(SidebarLink,
        :name => "Name",
        :link_to => "Link To",
        :icon => "Icon"
      )
    ])
  end

  it "renders a list of sidebar_links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Link To".to_s, :count => 2
    assert_select "tr>td", :text => "Icon".to_s, :count => 2
  end
end
