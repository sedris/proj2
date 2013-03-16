class Saved < ActiveRecord::Base
  belongs_to :shopper
  has_and_belongs_to_many :items
  has_many :carts
end
