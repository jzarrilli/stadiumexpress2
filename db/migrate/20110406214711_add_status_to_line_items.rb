class AddStatusToLineItems < ActiveRecord::Migration
    def self.up
      add_column :line_items, :status, :integer, :default => 0
    end

    def self.down
      remove_column :line_items, :status
    end
  

end
