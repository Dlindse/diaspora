class CreateInfluences < ActiveRecord::Migration[5.0]
  def change
    create_table :influences do |t|
      t.string :author
      t.string :title
      t.string :period
      t.string :circa

      t.timestamps
    end
  end
end
