require 'spec_helper'

describe "amenities/edit" do
  before(:each) do
    @amenity = assign(:amenity, stub_model(Amenity,
      :name => "MyString",
      :category => "MyString"
    ))
  end

  it "renders the edit amenity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", amenity_path(@amenity), "post" do
      assert_select "input#amenity_name[name=?]", "amenity[name]"
      assert_select "input#amenity_category[name=?]", "amenity[category]"
    end
  end
end
