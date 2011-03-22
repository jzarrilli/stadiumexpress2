class CreateStadia < ActiveRecord::Migration
  def self.up
    create_table :stadia do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :stadia
  end
end
