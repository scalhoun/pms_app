class SessionsController < ApplicationController
	before_filter :redirect_signed_in_user, :except => [:destroy]

	def new
	end

	def create
		# Get user by email address && use authenticate from has_secure_password
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			sign_in user
			redirect_to root_url, :notice => "Logged in!"
		else
			flash.now[:error] = "Invalid email or password"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url, :notice => "Logged out!"
	end

	private
		def redirect_signed_in_user
			deny_access_signed_in if signed_in?
		end

end
