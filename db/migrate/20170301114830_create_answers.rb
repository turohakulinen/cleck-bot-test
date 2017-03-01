class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :node, foreign_key: true
      t.string :photo
      t.string :type
      t.text :message
      t.string :name

      t.timestamps
    end
  end
end
