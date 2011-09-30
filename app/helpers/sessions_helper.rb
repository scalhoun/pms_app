module SessionsHelper
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def sign_in(user)
		session[:user_id] = user.id	
	end

	def sign_out
		session[:user_id] = nil
	end

	def signed_in?
		!current_user.nil?
	end

	def redirect_back_or(default)
		redirect_to(session[:redirect_to] || default)
		clear_return_to
	end

	private

		def deny_access_signed_out
			  store_location
			  redirect_to signin_path, :notice => "Please sign in to continue"
		end
		
		def deny_access_signed_in
			# User is signed in, send back to where they came from
			redirect_to root_path
		end

		def store_location
			session[:redirect_to] = request.fullpath
		end

		def clear_return_to
			session[:redirect_to] = nil	
		end

		
end
