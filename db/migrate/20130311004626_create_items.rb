class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :quantity
      t.integer :user_id

      t.timestamps
    end
  end
end
