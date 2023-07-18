class Phone < ApplicationRecord
    has_many :orderables
    has_many :carts, through: :orderables
    
    validates :name, presence: true
    validates :ram, presence: true
    validates :storage, presence: true
    validates :brand, presence: true
    validates :price, presence: true
end
