class CreateCredits < ActiveRecord::Migration
  def self.up
    create_table :credits do |t|
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
    drop_table :credits
  end
end
