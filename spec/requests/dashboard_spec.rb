require 'spec_helper'

describe "Dashboard" do
	before { visit new_user_session_path }
	let(:user) { FactoryGirl.create(:user) }
	before do
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
	
	describe "content after sign in" do
		before { visit dashboard_path }

		it "should say property name" do
			expect(page).to have_content('My Sites')
			expect(page).to have_link('Create New Site', href: new_site_path )
		end

	end

	describe "subdomain content after sign in" do

		before { visit dashboard_path }

		it "should say hello" do
			expect(page).to have_content('Hello')
		end
		
	end

end