class CreateStyles < ActiveRecord::Migration
  def self.up
    create_table :styles do |t|
      t.integer :brewery_id
      t.string  :name
      t.string  :slug
      t.timestamps
    end
  end

  def self.down
    drop_table :styles
  end
end
