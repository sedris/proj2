class ShoppersController < ApplicationController
	def new
		@user = Shopper.new
	end

	def create
		@user = Shopper.new(params[:shopper])
		if @user.save
			# set the session for the newly created user
			# user will be "logged in"
			session[:user_id] = @user.id
			redirect_to root_url, :notice => "signed up!"
		else
			render "new"
		end
	end
end