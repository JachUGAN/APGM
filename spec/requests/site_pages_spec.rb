require 'spec_helper'

describe "Site pages" do


	subject { page }	#this tells RSPEC that page is the subject of the tests instead of putting page.should 
	
	describe "Home page" do

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
	
	#TO make an Edit post test will be tricky i think since i'll have to get some test record for that to work
end	 
