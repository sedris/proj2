class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :authenticate

  private
  def current_user
  	# if current_user is nil or false and there's a seesion, find user by id
  	@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  
  def authenticate
    if !current_user
    	@current_user = User.new()
      redirect_to signup_path, :notice => "Must be logged in to view" and return
    end
  end
end
