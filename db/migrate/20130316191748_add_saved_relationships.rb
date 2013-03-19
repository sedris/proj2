class AddSavedRelationships < ActiveRecord::Migration
  def up
  	# cart belongs to saved
  	# saved belongs to shopper
  	add_column :carts, :saved_id, :integer

  	create_table 'items_saveds', :id => false do |t|
    	t.column :item_id, :integer
    	t.column :saved_id, :integer
		end
  end

  def down
  	drop_table 'items_saved'
  	remove_column :carts, :saved_id
  end
end
