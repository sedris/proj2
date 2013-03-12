class CartsController < ApplicationController
  # GET /cart
  # GET /cart.json
  def index
    @cart = current_user.cart
    @items = current_user.cart.items

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  
  end

  def remove_from_cart
    if !current_user
      redirect_to signup_path, :notice => "Must be logged in to view" and return
    end
  	item = current_user.cart.items.find(params[:item])
    current_user.cart.items.delete(item)
    redirect_to cart_path
  end

end