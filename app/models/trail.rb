class Trail < ActiveRecord::Base
    belongs_to :user
    has_many :trail_categories
    has_many :categories, through: :trail_categories
end