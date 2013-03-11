class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :type
  has_secure_password

  # if shopper
  #has_one :cart
  #has_many :orders
  # if shopkeeper
  #has_many :items

  # TODO: validate email? doesn't really matter...
  validates_presence_of :email, :on => :create
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
end
