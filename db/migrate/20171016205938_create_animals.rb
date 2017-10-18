class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :latinName
      t.float :weight
      t.float :size
      t.decimal :price
      t.string :description
      t.string :sex
      t.integer :typeani
      t.string :observations
      t.string :linkfb
      t.integer :animalcat_id
      t.integer :active
      t.string :photo

      t.timestamps
    end
    add_index :animals, :animalcat_id
  end
end
