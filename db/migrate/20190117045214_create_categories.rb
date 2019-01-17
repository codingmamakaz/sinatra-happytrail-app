class CreateCategories < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
    end
  end
end
