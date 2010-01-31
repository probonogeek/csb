class CreateBatches < ActiveRecord::Migration
  def self.up
    create_table :batches do |t|
      t.integer  :style_id
      t.string   :volume
      t.text     :recipe
      t.datetime :brewed_at
      t.datetime :ready_at
      t.timestamps
    end
  end

  def self.down
    drop_table :batches
  end
end
