class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :type
  has_secure_password

  # TODO: validate username? doesn't really matter...
  validates_presence_of :username, :on => :create
  validates_uniqueness_of :username
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
end
