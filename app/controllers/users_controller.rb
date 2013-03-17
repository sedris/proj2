class UsersController < ApplicationController
	skip_before_filter :authenticate, :only => [:new, :destroy]

	def new
		@user = User.new
		render :layout => "signup"
	end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
  	# remove user from session
  	session[:user_id] = nil
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_url}
      format.json { head :no_content }
    end
  end
end
