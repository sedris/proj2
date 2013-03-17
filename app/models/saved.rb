class Saved < ActiveRecord::Base
  belongs_to :shopper
  has_and_belongs_to_many :items
  has_many :carts

  def add_cart(cart)
  	if cart.items.empty?
			errors.add(:cart, 'is empty. Cannot save.')
  	else
  		self.carts.push(cart)
  	end
  end
end
