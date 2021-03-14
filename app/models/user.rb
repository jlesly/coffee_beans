class User < ActiveRecord::Base
    has_many :espressos
    has_secure_password 
    validates :name, :email, :password_digest, presence: true, uniqueness: true
end 