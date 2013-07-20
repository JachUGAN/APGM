class UsersController < ApplicationController
load_and_authorize_resource

	def new_user
		@user = User.new
    #authorize! :create, @user
	end

	def show
		@user = User.find(params[:id])
	end

	def create 		#This is associated with the create button in users/new_user
  	@user = User.new(params[:user])
		if @user.save
      		flash[:success] = "User Created"
			redirect_to root_path       #sends to the post page
		else
			render 'new_user'
		end
  end

	def edit
    @user = User.find(params[:id])    
    #authorize! :update, @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

end
