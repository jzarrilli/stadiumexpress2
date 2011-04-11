class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.string :name
      t.integer :number
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :expiration

      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
