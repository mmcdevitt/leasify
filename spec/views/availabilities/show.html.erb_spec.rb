require 'spec_helper'

describe "availabilities/show" do
  before(:each) do
    @availability = assign(:availability, stub_model(Availability,
      :title => "Title",
      :suite_or_floor => "Suite Or Floor",
      :availability => "Availability",
      :sf => 1,
      :rental_rate => 2,
      :content => "MyText",
      :user_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Suite Or Floor/)
    rendered.should match(/Availability/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
    rendered.should match(/3/)
  end
end
