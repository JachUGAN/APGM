# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'spec_helper'

describe Post do
  before do 
		@post = Post.new(title: "example title", content: "The is some content to test the Post model using rspec and capybara")
	end


	subject { @post }	 #subject { @post } lets us leave off @post from the should (@post.should )

	it { should respond_to(:title) }
	it { should respond_to(:content) }

	it { should be_valid }

	#Attributes presence tests

	describe "when title is not present" do
		before { @post.title = " " }
		it { should_not be_valid }
	end

	describe "when content is not present" do
		before { @post.content = " " }
		it { should_not be_valid }
	end

end
