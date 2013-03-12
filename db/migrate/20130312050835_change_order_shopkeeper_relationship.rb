class ChangeOrderShopkeeperRelationship < ActiveRecord::Migration
  def up
  	create_table 'orders_shopkeepers', :id => false do |t|
    	t.column :shopkeeper_id, :integer
    	t.column :order_id, :integer
		end

		rename_column :orders, :user_id, :cart_id
    rename_column :carts, :user_id, :shopper_id
  end

  def down
  	drop_table 'orders_shopkeepers'
  	rename_column :orders, :cart_id, :user_id
    rename_column :carts, :shopper_id, :user_id
  end
end
