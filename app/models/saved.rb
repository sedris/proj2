class Saved < ActiveRecord::Base
  belongs_to :shopper
  has_and_belongs_to_many :items
  has_many :carts

  # Only save a cart if it has items, return an error otherwise
  def add_cart(cart)
  	if cart.items.empty?
			errors.add(:cart, 'is empty. Cannot save.')
  	else
  		self.carts.push(cart)
  	end
  end

  def get_unpurchased_carts
    carts = []
    self.carts.each do |cart|
      if !cart.items.empty?
        carts.push(cart)
      end
    end
    return carts
  end
end
