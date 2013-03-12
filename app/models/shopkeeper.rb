class Shopkeeper < Shopper 
	has_many :items, :dependent => :destroy
end