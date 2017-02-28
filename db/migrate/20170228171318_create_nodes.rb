class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      t.string :question_s
      t.string :question_k
      t.string :name
      t.text :description
      t.integer :priority
      t.references :node, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
