require 'spec_helper'

describe "Site pages" do

	subject { page }	#this tells RSPEC that page is the subject of the tests

	describe "Home page" do
		subject { page }
		before { visit root_path }

		it { should have_selector('title', text: full_title('Home')) }
	end

	
	describe "Contact page" do
		before { visit contact_path }
		
		it { should have_selector('title', text: full_title('Contact')) }
	end

	describe "New Post page" do
		before { visit new_post_path }
		
		it { should have_selector('title', text: full_title('New Post')) }
	end

	

end	 
#TESTS NOT WORKING :/