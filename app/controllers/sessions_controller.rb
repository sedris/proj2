class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_username(params[:username])
		# authenticate method provided by has_secure_password
		# on the user class
		if user && user.authenticate(params[:password])
			# set the session for the logged in user
			session[:user_id] = user.id 
			redirect_to root_url
		else
			@alert = "Invalid username or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
