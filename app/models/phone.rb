class Phone < ApplicationRecord
    has_many :orderables
    has_many :carts, through: :orderables
    
    validates :name, presence: true
    validates :ram, presence: true, numericality: { only_integer: true }
    validates :storage, presence: true, numericality: { only_integer: true }
    validates :brand, presence: true
    validates :price, presence: true, numericality: { only_float: true }
end
