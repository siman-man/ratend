class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name, :null => false
      t.integer :limit, :null => false
      t.text :content
      t.datetime :start_at, :null => false
      t.datetime :end_at, :null => false
      t.boolean :all_day, :default => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
