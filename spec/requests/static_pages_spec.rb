require 'spec_helper'

describe "Static Pages" do
	describe "Home page" do
		before { visit root_path }

		it "should have the content Create your office website in minutes" do
			
			expect(page).to have_selector('h1', 'Create your office website in minutes')
			expect(page).to have_selector('h3', 'The easiest way to build a website for CRE properties')
		
		end

		it "should have sign in and register links" do

			expect(page).to have_link('Login', href: new_user_session_path)
			expect(page).to have_link('Sign Up', href: register_path)
			expect(page).to have_link('Join the Beta', href: register_path)

		end 

		describe "navbar should say dashboard in the navbar after sign in" do
			before { visit new_user_session_path }
			let(:user) { FactoryGirl.create(:user) }
			before do
	      fill_in "Username", with: user.username
	      fill_in "Password", with: user.password
	      click_button "Sign in"
	    end

			before { visit root_path }
			

			it "should say Your Dashboard" do 
				expect(page).to have_content('Your Dashboard') 
			end

		end

	end
end