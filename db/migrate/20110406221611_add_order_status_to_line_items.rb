class AddOrderStatusToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :order_status, :integer, :default => 1
  end

  def self.down
    remove_column :line_items, :order_status
  end


end
