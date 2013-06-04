FactoryGirl.define do
	factory :user do
		first_name "ex_fname"
		last_name "ex_lname"
		username "testuser"
		email "user@example.com"
		role "author"
		password "passcode"
		password_confirmation "passcode"
	end
end