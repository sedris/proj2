class ChangeUserType < ActiveRecord::Migration
  def up
  	remove_column :users, :type
  	add_column :users, :isShopkeeper, :boolean
  	rename_column :items, :shopkeeper_id, :user_id
  	rename_column :carts, :shopper_id, :user_id
  end

  def down
  	remove_column :users, :isShopkeeper
  	add_column :users, :type, :string
  	rename_column :items, :user_id, :shopkeeper_id
  	rename_column :carts, :user_id, :shopper_id
  end
end
