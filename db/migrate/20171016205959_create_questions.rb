class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :order
      t.integer :typeans
      t.integer :active

      t.timestamps
    end
  end
end
