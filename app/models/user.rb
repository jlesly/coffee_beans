class User < ActiveRecord::Base
    has_many :espresso
    has_secure_password 
end 