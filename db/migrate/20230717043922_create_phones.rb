class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.string :name
      t.string :ram
      t.string :brand
      t.float :price
      t.integer :storage

      t.timestamps
    end
  end
end
