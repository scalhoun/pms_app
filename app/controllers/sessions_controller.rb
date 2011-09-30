class SessionsController < ApplicationController
	
	def new
	end

	def create
		# Get user by email address && use authenticate from has_secure_password
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, :notice => "Logged in!"
		else
			flash.now.error = "Invalid email or password"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end

end
