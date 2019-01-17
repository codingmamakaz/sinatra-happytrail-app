class Category < ActiveRecord::Base
    has_many :trail_categories
    has_many :trails, through: :trail_categories
    has_many :users, through: :trails
end