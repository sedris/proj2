class SavedsController < ApplicationController
	# display all saved items and carts for current user
	def index
		saved = current_user.saved
		@items = saved.items
		@carts = saved.get_unpurchased_carts
		#redirect to saved_cart_url(:cart_id => cart_id)
	end

	def cart
		@cart = params[:cart_id]
	end

	# add item to saved
	def add_item
		current_user.saved.items.push(Item.find(params[:item]))
		redirect_to :back
	end

	# create copy of cart and save
	# use copy as this is a static view of the current cart
	def add_cart
		cart = Cart.create()
		Cart.find(params[:cart]).items.each do |item|
			cart.items.push(item)
		end
		current_user.saved.add_cart(cart)
		if current_user.saved.errors.empty?
			redirect_to saved_path, :notice => "Cart saved"
		else
			redirect_to :back, :notice => current_user.saved.errors.full_messages().last
		end
	end

	# remove item from saved items
	def remove_item
	saved = current_user.saved
	item = saved.items.find(params[:item])
    saved.items.delete(item)
    redirect_to :back
	end

	# remove cart from saved items and delete it
	def remove_carts
		cart = current_user.saved.carts.find(params[:cart])
    #saved.carts.delete(cart)
    cart.destroy
    redirect_to :back
	end

end