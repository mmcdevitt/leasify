require 'spec_helper'

describe "amenities/new" do
  before(:each) do
    assign(:amenity, stub_model(Amenity,
      :name => "MyString",
      :category => "MyString"
    ).as_new_record)
  end

  it "renders new amenity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", amenities_path, "post" do
      assert_select "input#amenity_name[name=?]", "amenity[name]"
      assert_select "input#amenity_category[name=?]", "amenity[category]"
    end
  end
end
