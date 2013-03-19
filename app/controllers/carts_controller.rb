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

  def add_to_cart
    if !current_user.cart
      current_user.cart = Cart.create()
    end
    current_user.cart.items.push(Item.find(params[:item]))
    #redirect_to items_path(shopkeeper_id: params[:shopkeeper_id])
    redirect_to :back
  end
  
  def remove_from_cart
  	item = current_user.cart.items.find(params[:item])
    current_user.cart.items.delete(item)
    redirect_to :back
  end

end