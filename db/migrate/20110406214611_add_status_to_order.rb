class AddStatusToOrder < ActiveRecord::Migration
    def self.up
      add_column :orders, :order_status, :integer, :default => 0
    end

    def self.down
      remove_column :orders, :order_status
    end
  

end
