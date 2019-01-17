class User < ActiveRecord::Base
    has_many :trails
    has_many :categories, through: :trails

    has_secure_password
end