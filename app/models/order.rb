class Order < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :cart
  has_and_belongs_to_many :items
  has_and_belongs_to_many :shopkeepers

  validate :cart_not_empty, :before => :create

  private
	  def cart_not_empty
	  	if self.cart.items.empty?
	  		errors.add(:cart, 'is empty')
	  	end
	  end
end
