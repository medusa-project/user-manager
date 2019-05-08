class ApplicationController < ActionController::Base

  include SessionsHelper

  def require_admin
    unless signed_in?
      store_location
      redirect_to signin_url, notice: 'Please sign in.'
    end
  end

end
