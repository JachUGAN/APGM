class UsersController < ApplicationController


	def new_user
		@user = User.new
	end

	def create 		#This is associated with the create button in users/new_user
  	@user = User.new(params[:user])
		if @user.save
      		flash[:success] = "Post Created"
			redirect_to root_path       #sends to the post page
		else
			render 'new_user'
		end
  end

end
