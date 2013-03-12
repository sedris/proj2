class OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def create
		@cart = current_user.cart
		@order = current_user.cart.create_order()
		@cart.items.each do |item|
			@order.items << item
			if !@order.shopkeepers.include?(item.shopkeeper)
				@order.shopkeepers << item.shopkeeper
			end
		end 
		current_user.cart = Cart.create()
		redirect_to cart_path :notice => current_user.cart.id
	end
end