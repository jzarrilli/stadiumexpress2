class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.integer :product_id
      t.string product.title
      t.integer :cart_id
      t.string order.name
      t.integer :status, :default => 0
      t.integer :order_status, :default => 0
      
      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
