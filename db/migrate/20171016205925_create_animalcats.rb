class CreateAnimalcats < ActiveRecord::Migration[5.1]
  def change
    create_table :animalcats do |t|
      t.string :name
      t.string :video
      t.integer :active

      t.timestamps
    end
  end
end
