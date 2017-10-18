class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :test_id
      t.integer :answer_id

      t.timestamps
    end
        add_index :results, :test_id
    add_index :results, :answer_id
  end
end
