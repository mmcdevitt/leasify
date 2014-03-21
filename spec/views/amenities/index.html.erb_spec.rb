require 'spec_helper'

describe "amenities/index" do
  before(:each) do
    assign(:amenities, [
      stub_model(Amenity,
        :name => "Name",
        :category => "Category"
      ),
      stub_model(Amenity,
        :name => "Name",
        :category => "Category"
      )
    ])
  end

  it "renders a list of amenities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
