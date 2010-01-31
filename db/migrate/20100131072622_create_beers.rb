class CreateBeers < ActiveRecord::Migration
  def self.up
    create_table :beers do |t|
      t.integer :batch_id
      t.string  :name
      t.string  :slug
      t.string  :abv
      t.string  :ibu
      t.string  :yeast
      t.string  :volume
      t.text    :tasting_notes
      t.timestamps
    end
  end

  def self.down
    drop_table :beers
  end
end
