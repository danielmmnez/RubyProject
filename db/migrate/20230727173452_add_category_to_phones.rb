class AddCategoryToPhones < ActiveRecord::Migration[7.0]
  def change
    add_reference :phones, :category, null: false, foreign_key: true
  end
end
