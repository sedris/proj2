class OrdersController < ApplicationController
	def index
		@orders = current_user.cart.orders
		#@shopkeeper = Shopkeeper.find_by_id(session[:user_id])
	end

	# creates an order from a specified cart
	def create
		@cart = current_user.cart
		@order = current_user.cart.orders.create()
		@cart.items.each do |item|
			@order.items << item
			if !@order.shopkeepers.include?(item.shopkeeper)
				@order.shopkeepers << item.shopkeeper
			end
		end 

		# empty the cart
		current_user.cart.items = []
		redirect_to cart_path
	end

	# GET /order/1
  # GET /order/1.json
  # Shows information for this order
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end
end