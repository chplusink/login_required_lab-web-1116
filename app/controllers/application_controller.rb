class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user

  # private

  def current_user
    @current_user ||= session[:name]
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perform that action"
      redirect_to new_sessions_path
    end
  end

end
