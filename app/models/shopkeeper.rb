class Shopkeeper < Shopper 
	has_many :items, :dependent => :destroy
	has_and_belongs_to_many :orders

	def get_store_orders
		shopkeeper_orders = []
		Order.all.each do |o|
			if o.shopkeepers.include?(self)
				shopkeeper_orders.append(o)
			end
		end
		return shopkeeper_orders
	end

end