class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.integer :user_id
      t.integer :length
      t.boolean :bathroom, null: false
      t.boolean :cell_reception, null: false
      t.timestamps null: false
    end
  end
end
