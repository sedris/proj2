class Order < ActiveRecord::Base
  attr_accessible :user_id
  attr_accessor :shopper
  attr_reader :shopper
  belongs_to :cart
  has_and_belongs_to_many :items
  has_and_belongs_to_many :shopkeepers

  validate :cart_not_empty, :before => :create

  # order either came from shopper's main cart or saved cart
  def shopper()
    if order.cart.shopper
      self.shopper = order.cart.shopper
      @shopper = order.cart.shopper
    else
      self.shopper = order.cart.saved.shopper
      @shopper = order.cart.saved.shopper
    end 
  end

  private
	  def cart_not_empty
	  	if self.cart.items.empty?
	  		errors.add(:cart, 'is empty')
	  	end
	  end
end
