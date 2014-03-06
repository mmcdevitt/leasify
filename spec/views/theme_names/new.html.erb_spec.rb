require 'spec_helper'

describe "theme_names/new" do
  before(:each) do
    assign(:theme_name, stub_model(ThemeName,
      :name => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new theme_name form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", theme_names_path, "post" do
      assert_select "input#theme_name_name[name=?]", "theme_name[name]"
      assert_select "input#theme_name_user_id[name=?]", "theme_name[user_id]"
    end
  end
end
