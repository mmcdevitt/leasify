require 'spec_helper'

describe "sidebar_links/show" do
  before(:each) do
    @sidebar_link = assign(:sidebar_link, stub_model(SidebarLink,
      :name => "Name",
      :link_to => "Link To",
      :icon => "Icon"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Link To/)
    rendered.should match(/Icon/)
  end
end
