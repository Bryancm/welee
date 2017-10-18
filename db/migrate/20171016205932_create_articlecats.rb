class CreateArticlecats < ActiveRecord::Migration[5.1]
  def change
    create_table :articlecats do |t|
      t.string :name
      t.string :video
      t.integer :active

      t.timestamps
    end
  end
end
