class DashboardController < ApplicationController
  before_filter :redirect_if_signed_out

  def index
  end

end
