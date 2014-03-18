require 'spec_helper'

describe "Availabilities" do

	describe "Index page" do

		it "should have the content Availabilities" do

			visit '/dashboard/sites/new'
			expect(page).to have_content('Website Address')

		end

	end

end
