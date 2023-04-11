class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception    

  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:error] = "We apologize, but this information could not be found."
    redirect_to home_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "We apologize, but you are not authorized to view this page."
    redirect_to home_path
  end

  def current_user
    @current_user ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end
  helper_method :current_user

  def logged_in?
    current_user
  end

  def check_login
    redirect_to login_path, alert: "You need to log in to view this page." if !logged_in?
  end
    private

end
