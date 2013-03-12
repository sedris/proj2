class CartsController < ApplicationController
  # GET /carts
  # GET /carts.json
  def index
    flash.now.alert = current_user.email
    @items = current_user.cart.items
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end
end