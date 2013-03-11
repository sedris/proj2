class Shopkeeper < Shopper 
	#has_one :catalog, :dependent => destroy
	has_many :items
end