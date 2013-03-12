class ShopkeepersController < ApplicationController
	def new
		@user = Shopkeeper.new
	end

	def create
		@user = Shopkeeper.new(params[:shopkeeper])
		if @user.save
			# set the session for the newly created user
			# user will be "logged in"
			session[:user_id] = @user.id
			redirect_to root_url, :notice => "signed up!"
		else
			render "new"
		end
	end

  # DELETE /shopkeepers/1
  # DELETE /shopkeepers/1.json
  def destroy
    @user = Shopkeeper.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end