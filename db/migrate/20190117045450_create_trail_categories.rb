class CreateTrailCategories < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.integer :trail_id
      t.integer :category_id
    end
  end
end
