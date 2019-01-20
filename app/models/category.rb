class Category < ActiveRecord::Base
    has_many :trail_categories
    has_many :trails, through: :trail_categories
    has_many :users, through: :trails

    def slug
        name.downcase.tr(' ', '-')
    end
    
    def self.find_by_slug(slug)
        Category.all.find { |category| category.slug == slug }
    end
end