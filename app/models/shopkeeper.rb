class Shopkeeper < Shopper 
	has_many :items, :dependent => :destroy
	has_and_belongs_to_many :orders
end