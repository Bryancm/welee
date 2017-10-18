class CreateCoincidences < ActiveRecord::Migration[5.1]
  def change
    create_table :coincidences do |t|
      t.integer :animal_id
      t.string :consideration

      t.timestamps
    end
    add_index :coincidences, :animal_id
  end
end
