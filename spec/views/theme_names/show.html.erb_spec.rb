require 'spec_helper'

describe "theme_names/show" do
  before(:each) do
    @theme_name = assign(:theme_name, stub_model(ThemeName,
      :name => "Name",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
