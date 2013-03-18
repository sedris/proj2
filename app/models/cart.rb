class Cart < ActiveRecord::Base
  attr_accessible :shopper_id
  belongs_to :shopper
  has_and_belongs_to_many :items
  has_many :orders
  belongs_to :saved
end
