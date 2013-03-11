class CreateOrders < ActiveRecord::Migration
  def change
  	# only create table if it doesn't exist (kept getting errors)
  	if (!ActiveRecord::Base.connection.tables.include?("orders"))
    	create_table :orders do |t|
      		t.integer :user_id

      		t.timestamps
    end
    end
  end
end
