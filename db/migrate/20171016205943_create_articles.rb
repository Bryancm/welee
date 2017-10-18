class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :animal_id
      t.integer :articlecat_id
      t.integer :active
      t.string :photo

      t.timestamps
    end
        add_index :articles, :animal_id
    add_index :articles, :articlecat_id
  end
end
