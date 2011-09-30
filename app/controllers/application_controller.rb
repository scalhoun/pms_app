class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  private
    def redirect_if_signed_out
  	  deny_access_signed_out unless signed_in?
    end

    def redirect_signed_in_user
	  deny_access_signed_in if signed_in?
    end

end
