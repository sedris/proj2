class RenameTables < ActiveRecord::Migration
  def self.up
    rename_table :orders_items, :items_orders
  end

 def self.down
    rename_table :items_orders, :orders_items
 end
end
