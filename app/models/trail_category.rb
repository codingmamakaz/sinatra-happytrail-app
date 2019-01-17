class TrailCategory < ActiveRecord::Base
    belongs_to :trail  
    belongs_to :category  
end