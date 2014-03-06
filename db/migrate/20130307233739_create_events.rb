class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :creator_id, :null => false

      t.string :name, :null => false
      t.string :location, :null => false

      t.string :starts_at, :null => false
      t.string :ends_at, :null => false

      t.timestamps
    end

    add_index :events, :creator_id
  end
end
