require 'spec_helper'

describe "availabilities/index" do
  before(:each) do
    assign(:availabilities, [
      stub_model(Availability,
        :title => "Title",
        :suite_or_floor => "Suite Or Floor",
        :availability => "Availability",
        :sf => 1,
        :rental_rate => 2,
        :content => "MyText",
        :user_id => 3
      ),
      stub_model(Availability,
        :title => "Title",
        :suite_or_floor => "Suite Or Floor",
        :availability => "Availability",
        :sf => 1,
        :rental_rate => 2,
        :content => "MyText",
        :user_id => 3
      )
    ])
  end

  it "renders a list of availabilities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Suite Or Floor".to_s, :count => 2
    assert_select "tr>td", :text => "Availability".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
