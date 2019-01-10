class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def not_authenticated
    flash[:alert] = "You must be logged in to see this page."
    redirect_to login_path
  end
end
