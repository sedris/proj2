class Cart < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :shopper
  has_and_belongs_to_many :items
  has_many :orders
end
