class CreateStands < ActiveRecord::Migration
  def self.up
    create_table :stands do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :stands
  end
end
