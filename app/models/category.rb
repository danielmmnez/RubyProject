class Category < ApplicationRecord
    has_many :phones, dependent: :restrict_with_exception
end
