require 'spec_helper'

describe "amenities/show" do
  before(:each) do
    @amenity = assign(:amenity, stub_model(Amenity,
      :name => "Name",
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Category/)
  end
end
