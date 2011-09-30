class UsersController < ApplicationController
	before_filter :redirect_signed_in_user, :only => [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in
			redirect_to root_url, :notice => "Signed Up"
		else
			render "new"
		end
	end

end
