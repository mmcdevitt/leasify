require 'spec_helper'

describe "availabilities/new" do
  before(:each) do
    assign(:availability, stub_model(Availability,
      :title => "MyString",
      :suite_or_floor => "MyString",
      :availability => "MyString",
      :sf => 1,
      :rental_rate => 1,
      :content => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new availability form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", availabilities_path, "post" do
      assert_select "input#availability_title[name=?]", "availability[title]"
      assert_select "input#availability_suite_or_floor[name=?]", "availability[suite_or_floor]"
      assert_select "input#availability_availability[name=?]", "availability[availability]"
      assert_select "input#availability_sf[name=?]", "availability[sf]"
      assert_select "input#availability_rental_rate[name=?]", "availability[rental_rate]"
      assert_select "textarea#availability_content[name=?]", "availability[content]"
      assert_select "input#availability_user_id[name=?]", "availability[user_id]"
    end
  end
end
