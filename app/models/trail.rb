class Trail < ActiveRecord::Base
    belongs_to :user
    has_many :trail_categories
    has_many :categories, through: :trail_categories

    def slug
        name.downcase.tr(' ', '-')
    end
    
    def self.find_by_slug(slug)
        Trail.all.find{|trail| trail.slug == slug}
    end
end