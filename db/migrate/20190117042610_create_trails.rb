class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.integer :user_id
      t.float :length
      t.string :bathroom
      t.string :cell_reception
      t.string :memo
      t.timestamps null: false
    end
  end
end
