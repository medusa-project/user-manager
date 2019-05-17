class ApplicationController < ActionController::Base

  include SessionsHelper

  def require_authenticated
    unless signed_in?
      store_location
      redirect_to signin_url, notice: 'Please sign in.'
    end
  end

  def require_admin
    unless current_user&.admin?
      flash['error'] = 'Access denied.'
      redirect_back fallback_location: root_path
    end
  end

end
