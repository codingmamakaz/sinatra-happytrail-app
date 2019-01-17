class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.integer :user_id
      t.integer :length
      t.boolean :bathroom
      t.boolean :cell_reception
      t.timestamps null: false
    end
  end
end
