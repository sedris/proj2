class UsersController < ApplicationController
	def new
		@user = User.new
	end

	# GET /users
	# GET /users.json
	def index
		@users = User.all

		respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @users }
		end
	end

	def create
		# 1 for checked -> create shopkeeper
		# 0 for unchecked -> create shopper
		if (params[:user]["isShopkeeper"] == "1")
			params[:user]["isShopkeeper"] = true
			@user = User.new(params[:user])
		else
			params[:user]["isShopkeeper"] = false
			@user = User.new(params[:user])
		end
		if @user.save
			# set the session for the newly created user
			# user will be "logged in"
			session[:user_id] = @user.id
			redirect_to root_url, :notice => "signed up!"
		else
			render "new"
		end
	end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url}
      format.json { head :no_content }
    end
  end
end
