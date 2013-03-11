class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price, :quantity
  belongs_to :user

  has_and_belongs_to_many :orders
  has_and_belongs_to_many :carts

end
