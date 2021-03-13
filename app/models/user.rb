class User < ActiveRecord::Base
    has_many :espresso
    has_secure_password 
    validates :name, :email, :password_digest, presence: true, uniqueness: true
end 