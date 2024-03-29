class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :checked_out?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
  
  def require_user
    access_denied unless logged_in?
  end

  def checked_out?
    self.checked_out == true
  end

  def any_checked_out?
    self.all.each do |obj|
      obj.checked_out
    end
  end

  def access_denied
    flash[:alert] = 'You must be logged in to do that.'
    redirect_to login_path
  end

end
