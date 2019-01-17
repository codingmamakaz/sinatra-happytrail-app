class CreateTrailCategories < ActiveRecord::Migration
  def change
    create_table :trail_categories do |t|
      t.integer :trail_id
      t.integer :category_id
    end
  end
end
