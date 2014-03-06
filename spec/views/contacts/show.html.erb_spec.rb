require 'spec_helper'

describe "contacts/show" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :first_name => "First Name",
      :last_name => "Last Name",
      :company => "Company",
      :job_title => "Job Title",
      :phone => "Phone",
      :email => "Email",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Company/)
    rendered.should match(/Job Title/)
    rendered.should match(/Phone/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
  end
end
