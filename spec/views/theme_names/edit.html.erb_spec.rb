require 'spec_helper'

describe "theme_names/edit" do
  before(:each) do
    @theme_name = assign(:theme_name, stub_model(ThemeName,
      :name => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit theme_name form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", theme_name_path(@theme_name), "post" do
      assert_select "input#theme_name_name[name=?]", "theme_name[name]"
      assert_select "input#theme_name_user_id[name=?]", "theme_name[user_id]"
    end
  end
end
