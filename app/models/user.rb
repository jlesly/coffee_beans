class User < ActiveRecord::Base
    has_many :beans
    has_secure_password 
end 