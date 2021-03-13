class Espresso < ActiveRecord::Base
    belongs_to :user
    validates :name, :brand, :grind_size, :dose, :extraction_volume, :extraction_time, presence: true
end 

