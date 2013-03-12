class ShoppersController < ApplicationController
	skip_before_filter :authenticate, :only => [:new, :create]

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

  # DELETE /shoppers/1
  # DELETE /shoppers/1.json
  def destroy
    @user = Shopper.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url}
      format.json { head :no_content }
    end
  end
end