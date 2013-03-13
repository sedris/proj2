class Order < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :cart
  has_and_belongs_to_many :items
  has_and_belongs_to_many :shopkeepers

	# only add shopkeeper
	after_create :create_cart

	def create_cart
		self.cart = Cart.create()
	end
end
