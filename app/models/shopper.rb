class Shopper < User
	has_one :cart, :dependent => :destroy
	has_one :saved
	
	# make an empty cart and saved items/carts after Shopper created
	after_create :create_extra

	def create_extra
		self.cart = Cart.create()
		self.saved = Saved.create()
	end
end