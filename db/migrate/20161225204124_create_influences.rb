class CreateInfluences < ActiveRecord::Migration[5.0]
  def change
    create_table :influences do |t|
      t.string :title
      t.string :author
      t.date :pubdate
      t.string :period

      t.timestamps
    end
  end
end
