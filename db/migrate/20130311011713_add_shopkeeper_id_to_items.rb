class AddShopkeeperIdToItems < ActiveRecord::Migration
    def up
        rename_column :items, :user_id, :shopkeeper_id
    end
    def down
        rename_column :items, :shopkeeper_id, :user_id
    end
end
