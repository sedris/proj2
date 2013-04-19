class OrdersController < ApplicationController
	def index
		@orders = []
		current_user.cart.orders.each do |order|
			@orders.push(order)
		end
		current_user.saved.carts.each do |cart|
			cart.orders.each do |order|
				@orders.push(order)
			end
		end
		#@shopkeeper = Shopkeeper.find_by_id(session[:user_id])
	end

	# creates an order from a specified cart
	def create
		@cart = Cart.find(params[:cart])
		@order = @cart.orders.create()
		if @order.save
			@cart.items.each do |item|
				# add items and respective shopkeepers to order
				# make a copy of the item so that item remains if order if deleted by shopkeeper
				@order.items << Item.create(:name => item.name, :description => item.description, :price => item.price)
				if !@order.shopkeepers.include?(item.shopkeeper)
					@order.shopkeepers << item.shopkeeper
				end
			end 

			# empty the cart
			@cart.items = []
			redirect_to :back, :flash => { :alert =>  "Checkout complete. Go to 'Orders' to view."}
		else
			redirect_to :back, :flash => { :alert =>  "Checkout not completed: Cart cannot be empty" }
		end
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