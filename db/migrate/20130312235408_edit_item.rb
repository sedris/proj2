class EditItem < ActiveRecord::Migration
  def up
  	remove_column :items, :quantity
  	remove_column :items, :price
  	add_column :items, :price, :decimal
  end

  def down
  	remove_column :items, :price
  	add_column :items, :price, :float
  	add_column :items, :quantity, :integer
  end
end

