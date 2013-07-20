module SessionsHelper

	def sign_in(user)
			cookies.permanent[:remember_token] = user.remember_token
			self.current_user = user 		#The use if self here is necessary else rails will just create a local variable called current_user
	end

	def current_user=(user)		#defines the assignement that is used above p352 hart
		@current_user = user
	end

	def signed_in?
		!current_user.nil?		#current user not nill
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])		#||= is the "or equales" assignement operator if @current_user is undefined it assigns @current_user 
																					# instance variable to the user corresponding to the remember token
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
	
end
