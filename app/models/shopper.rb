class Shopper < User
	has_one :cart, :dependent => :destroy

	# make an empty cart after Shopper created
	after_create :create_cart

	def create_cart
		self.cart = Cart.create()
	end
end