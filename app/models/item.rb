class Item < ActiveRecord::Base
  attr_accessible :description, :name, :price
  belongs_to :shopkeeper

  has_and_belongs_to_many :orders
  has_and_belongs_to_many :carts

  validates_presence_of :name, :on => :create
  validates_presence_of :price, :on => :create
end
