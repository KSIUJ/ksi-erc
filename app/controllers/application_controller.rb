class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :require_login
  before_action :authenticate_user!#, except: ['lock#authorize', 'lock#legacy_authorize']

  def not_authenticated
    flash[:alert] = "You must be logged in to see this page."
    redirect_to login_path
  end
end
