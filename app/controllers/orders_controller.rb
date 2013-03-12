class OrdersController < ApplicationController
	def index
		@orders = Order.all
		@shopkeeper = Shopkeeper.find_by_id(session[:user_id])
    # if no shopkeeper was found
    if !@shopkeeper
    	# TODO: authenticate
      @shopkeeper = Shopkeeper.all.last
    end

		@shopkeeper_orders = []
		Order.all.each do |o|
			if o.shopkeepers.include?(@shopkeeper)
				@shopkeeper_orders.append(o)
			end
		end
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
end