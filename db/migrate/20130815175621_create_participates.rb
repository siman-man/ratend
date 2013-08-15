class CreateParticipates < ActiveRecord::Migration
  def change
    create_table :participates do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :comment

      t.timestamps
    end

    add_index :participates, :user_id
    add_index :participates, :event_id
    add_index :participates, [:user_id, :event_id], unique: true
  end
end
