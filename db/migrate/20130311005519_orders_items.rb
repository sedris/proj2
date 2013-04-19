class OrdersItems < ActiveRecord::Migration
  def up
  	create_table 'orders_items', :id => false do |t|
    	t.column :order_id, :integer
    	t.column :item_id, :integer
	end
  end

  def down
  end
end
