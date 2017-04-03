class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.string :name
      t.references :work, foreign_key: true
      t.string :page
      t.string :line
      t.references :genre, foreign_key: true
      t.text :excerpt

      t.timestamps
    end
  end
end
