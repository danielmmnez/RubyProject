class Orderable < ApplicationRecord
  belongs_to :phone
  belongs_to :cart

  def total 
    phone.price * quantity
  end
end
