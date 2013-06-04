require 'spec_helper'

describe "User pages" do
	subject { page }

	
	#Profile page Layout test
	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }
		it { should have_selector('h1', text: user.first_name + " " + user.last_name) }
		it { should have_selector('title', text: full_title(user.username)) }
	end



	describe "Create new user" do

		before { visit newuser_path }

		let(:submit) { "Create a new user" }

		describe "with invalid information" do
			it "should not create a user" do
			expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "first_name", with: "ex_fname"
				fill_in "last_name", with: "ex_lname"
				fill_in "username", with: "testuser"
				fill_in "email", with: "user@example.com"
				fill_in "role", with: "author"
				fill_in "password", with: "passcode"
				fill_in "password_confirmation", with: "passcode"

				#NOT WORKING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! :(  )

			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end
	#describe "signup page" do	
	#	before { visit signup_path }
	#	it { should have_selector('h1', text: 'Sign up') }
	#	it { should have_selector('title', text: full_title('Sign up')) }
	#end
end