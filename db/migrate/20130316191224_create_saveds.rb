class CreateSaveds < ActiveRecord::Migration
  def change
    create_table :saveds do |t|
      t.references :shopper

      t.timestamps
    end
    add_index :saveds, :shopper_id
  end
end
