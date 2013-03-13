class CartsItems < ActiveRecord::Migration
  def up
  	create_table 'carts_items', :id => false do |t|
    	t.column :cart_id, :integer
    	t.column :item_id, :integer
	end
  end

  def down
  end
end
