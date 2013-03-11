class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private
  def current_user
  	# if current_user is nil or false and there's a seesion, find user by id
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
