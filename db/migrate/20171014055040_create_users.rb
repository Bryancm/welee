class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastName
      t.string :phone
      t.integer :typeu
      t.string :street
      t.string :exterior_number
      t.string :interior_number
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
