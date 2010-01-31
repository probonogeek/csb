class CreateBreweries < ActiveRecord::Migration
  def self.up
    create_table :breweries do |t|
      t.string   :name
      t.string   :slug
      t.datetime :opened_at
      t.timestamps
    end
  end

  def self.down
    drop_table :breweries
  end
end
