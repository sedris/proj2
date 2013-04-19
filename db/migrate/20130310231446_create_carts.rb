class CreateCarts < ActiveRecord::Migration
  def change
  	# only create table if it doesn't exist (kept getting errors)
  	if (!ActiveRecord::Base.connection.tables.include?("carts"))
    	create_table :carts do |t|
      		t.integer :user_id

      		t.timestamps
     end
    end
  end
end
